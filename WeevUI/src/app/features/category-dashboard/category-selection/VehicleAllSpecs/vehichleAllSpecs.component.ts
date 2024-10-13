import { Component, ChangeDetectorRef } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { VehiclesService } from 'src/app/modules/_services/vehicles.service';
import { ProductListModel } from 'src/app/modules/auth/_models/product.model';

@Component({
  selector: 'app-vehicleallspecs',
  templateUrl: './vehichleAllSpecs.component.html',
  styleUrls: ['./vehichleAllSpecs.component.scss'],
})
export class VehicleAllSpecsComponent {
  productListModel: ProductListModel | undefined;
  productID: number = 0;
  productlist: Array<ProductListModel> = new Array<ProductListModel>();

  activeTab: string = '';
  loading: boolean = false;
  loadingTimeout: any;

  constructor(
    private router: Router,
    private route: ActivatedRoute,
    private vehiclesService: VehiclesService,
    private cd: ChangeDetectorRef
  ) {
    this.route.params.subscribe((params) => (this.productID = params['twId']));
    this.activeTab = 'specs';
  }
  ngOnInit(): void {
    window.scrollTo(0, 0); // Scroll to top
    this.startLoading();
    this.productListModel = Object.assign({}, EMPTY_Application);
    if (this.productID != 0 || this.productID != undefined) {
      this.getProductDataWithID(+this.productID);
    }
  }

  startLoading() {
    this.loading = true;
    this.loadingTimeout = setTimeout(() => {
      this.loading = false;
      this.cd.detectChanges(); // Force change detection after navigation
    }, 500);
  }

  getTruncatedFeatures(features: string | undefined): string {
    if (features) {
      return features.length > 20 ? features.slice(0, 50) + '...' : features;
    }
    return '';
  }

  private transformResponse(response: any): any {
    const transformedResponse: any = {};

    // Iterate over the keys in keyDisplayMap
    for (const key in this.keyDisplayMap) {
      if (response.hasOwnProperty(key)) {
        transformedResponse[key] = this.valueTransformMap[key]
          ? this.valueTransformMap[key](response[key])
          : response[key];
      }
    }

    return transformedResponse;
  }

  getProductDataWithID(productID: any) {
    this.startLoading();
    this.vehiclesService
      .getProductDataWithID(productID)
      .subscribe((response) => {
        const transformedResponse = this.transformResponse(response);
        this.productlist = transformedResponse;
        this.productListModel = this.productlist;
      });
  }

  onDetails() {
    this.router.navigate(['/Selection', this.productID]);
  }

  onVarient() {
    this.twId = this.productID;
    this.router.navigate(['/Selection', this.twId]).then(() => {
      setTimeout(() => {
        const variants_Container = document.getElementById('variantsContainer');
        if (variants_Container) {
          variants_Container.scrollIntoView({ behavior: 'smooth' });
          // console.log('scrolling');
        } else {
          console.error('variantsContainer not found');
        }
      }, 100);
    });
  }

  onImages() {
    this.twId = this.productID;
    this.router.navigate(['/Selection', this.twId, 'Colors']);
  }

  twId: number = 0;
  onColors() {
    this.twId = this.productID;
    this.router.navigate(['/Selection', this.twId, 'Colors']).then(() => {
      setTimeout(() => {
        const imageContainer = document.getElementById('image_container');
        if (imageContainer) {
          imageContainer.scrollIntoView({ behavior: 'smooth' });
          // console.log('scrolling');
        }
      }, 200); // Set timeout to 500 milliseconds
    });
  }

  getOverviewSpecs(): Array<{ key: string; value: any }> {
    // const excludedKeys = ['path', 'twId']; // Define keys to exclude

    // // Iterate over all keys in productListModel except those in excludedKeys
    // return Object.keys(this.productListModel || {})
    //   .filter(key => !excludedKeys.includes(key)) // Exclude keys in excludedKeys
    //   .map((key) => {
    //     const value = this.productListModel?.[key as keyof ProductListModel];
    //     return value !== undefined && value !== '' && value !== null
    //       ? {
    //           key: this.keyDisplayMap[key] || key, // Use mapped key or original key
    //           value: value, // Use the transformed value directly
    //         }
    //       : null;
    //   })
    //   .filter((item): item is { key: string; value: any } => item !== null); // Type guard to filter out null values
    const selectedKeys = [
      'manufacturer',
      'model',
      'variant',
      'variantType',
      'exShowroomPrice',
      'maxSpeed',
      'chargingTime',
      'conditionOfVehicle',
      'accelration0To60kmph',
      'accelration0To40kmph',
      'category',
    ];

    return selectedKeys
      .map((key) => {
        const value = this.productListModel?.[key as keyof ProductListModel];
        return value !== undefined && value !== '' && value !== null
          ? {
              key: this.keyDisplayMap[key] || key, // Use mapped key or original key
              value: value, // Use the transformed value directly
            }
          : null;
      })
      .filter((item): item is { key: string; value: any } => item !== null); // Type guard to filter out null values
  }

  getBookingDetailSpecs(): Array<{ key: string; value: any }> {
    const selectedKeys = [
      'available',
      'offlineOronline',
      'bookingSite',
      'bookingPrice',
    ];

    return selectedKeys
      .map((key) => {
        const value = this.productListModel?.[key as keyof ProductListModel];
        return value !== undefined && value !== '' && value !== null
          ? {
              key: this.keyDisplayMap[key] || key, // Use mapped key or original key
              value: value, // Use the transformed value directly
            }
          : null;
      })
      .filter((item): item is { key: string; value: any } => item !== null); // Type guard to filter out null values
  }

  getPowerAndBatterySpecs(): Array<{ key: string; value: any }> {
    const selectedKeys = [
      'continuousPower',
      'motorPower',
      'rangeOfVehicle',
      'batteryType',
      'batteryCapacity',
      'chargingTime0To80Perc',
      'chargingTime0To100Perc',
      'chargingAtHome',
      'noOfBatteries',
      'swappableBattery',
    ];

    return selectedKeys
      .map((key) => {
        const value = this.productListModel?.[key as keyof ProductListModel];
        return value !== undefined && value !== '' && value !== null
          ? {
              key: this.keyDisplayMap[key] || key, // Use mapped key or original key
              value: value, // Use the transformed value directly
            }
          : null;
      })
      .filter((item): item is { key: string; value: any } => item !== null); // Type guard to filter out null values
  }

  getFeaturesSpecs(): Array<{ key: string; value: any }> {const selectedKeys = [
    'instrumentConsole',
    'bluetoothConnectivity',
    'navigation',
    'geoFencing',
    'antiTheftAlarm',
    'usbchargingPort',
    'underseatStorage',
    'distanceToEmptyIndicator',
    'chargerOutputMin',
    'chargerOutputMax',
    'chargingPoint',
    'fastCharging',
    'fastChargingTimeUpto80Perc',
    'ridingModes',
  
  ];

  return selectedKeys
    .map((key) => {
      const value = this.productListModel?.[key as keyof ProductListModel];
      return value !== undefined && value !== '' && value !== null
        ? {
            key: this.keyDisplayMap[key] || key, // Use mapped key or original key
            value: value, // Use the transformed value directly
          }
        : null;
    })
    .filter((item): item is { key: string; value: any } => item !== null); // Type guard to filter out null values
  }

  getAdditionalFeaturesSpecs(): Array<{ key: string; value: any }> {const selectedKeys = [
    'callOrsmsalerts',
    'musicControl',
    'centralLocking',
    'cruiseControl',
    'externalSpeakers',
    'speedometer',
    'tripmeter',
    'Odometer',
    'carryHook',  
    'abstractrtificialExhaustSoundSystem',
    'internetConnectivity',
    'operatingSystem',
    'processor',
    'mobileApplication',
     'chargingStationLocater',
    'gradeability',
    'clock',
    'lowBatteryIndicator',
  ];

  return selectedKeys
    .map((key) => {
      const value = this.productListModel?.[key as keyof ProductListModel];
      return value !== undefined && value !== '' && value !== null
        ? {
            key: this.keyDisplayMap[key] || key, // Use mapped key or original key
            value: value, // Use the transformed value directly
          }
        : null;
    })
    .filter((item): item is { key: string; value: any } => item !== null); // Type guard to filter out null values
  }

  getSpecificationsSpecs(): Array<{ key: string; value: any }> {const selectedKeys = [
    'bodyType',
    'dimensionsAndCapacity',
    'bootSpace',
    'width',
    'length',
    'height',
    'saddleHeight',
    'groundClearance',
    'wheelbase',
    'kerbWeight',
    'loadCarryingCapacity',
    'turnSignalLamp',
    'drls',
    'topSpeed',
    'motorType',
    'motorWarrantyForMonths',
    'motorWarrantyForKm',
    'driveType',
    'batteryWarrantyForMonth',
    'batteryWarrantyForKm',
    'waterProofRating',
    'suspensionFront',
    'suspensionRear',
    'brakesFront',
    'brakesRear',
    'tyreSize',
    'wheelSize',
    'wheelsType',
  ];

  return selectedKeys
    .map((key) => {
      const value = this.productListModel?.[key as keyof ProductListModel];
      return value !== undefined && value !== '' && value !== null
        ? {
            key: this.keyDisplayMap[key] || key, // Use mapped key or original key
            value: value, // Use the transformed value directly
          }
        : null;
    })
    .filter((item): item is { key: string; value: any } => item !== null); // Type guard to filter out null values
  }








  private keyDisplayMap: { [key: string]: string } = {
    manufacturer: 'Manufacturer',
    model: 'Model',
    variant: 'Variant',
    variantType: 'Variant Type',
    exShowroomPrice: 'Ex Showroom Price',
    maxSpeed: 'Max Speed',
    chargingTime: 'Charging Time',
    conditionOfVehicle: 'Condition of Vehicle',
    accelration0To60kmph: 'Accelration 0-60 kmph',
    accelration0To40kmph: 'Accelration 0-40 kmph',
    category: 'Category',
    available: 'Available',
    offlineOronline: 'Offline/Online',
    bookingSite: 'Booking Site',
    bookingPrice: 'Booking Price',
    continuousPower: 'Continuous Power',
    motorPower: 'Motor Power',
    rangeOfVehicle: 'Range of Vehicle',
    batteryType: 'Battery Type',
    batteryCapacity: 'Battery Capacity',
    chargingTime0To80Perc: 'Charging Time 0-80%',
    chargingTime0To100Perc: 'Charging Time 0-100%',
    chargingAtHome: 'Charging At Home',
    noOfBatteries: 'No of Batteries',
    swappableBattery: 'Swappable Battery',
    instrumentConsole: 'Instrument Console',
    bluetoothConnectivity: 'Bluetooth Connectivity',
    navigation: 'Navigation',
    geoFencing: 'Geo Fencing',
    antiTheftAlarm: 'Anti Theft Alarm',
    usbchargingPort: 'USB Charging Port',
    underseatStorage: 'Underseat Storage',
    distanceToEmptyIndicator: 'Distance to Empty Indicator',
    chargerOutputMin: 'Charger Output Min',
    chargerOutputMax: 'Charger Output Max',
    chargingPoint: 'Charging Point',
    fastCharging: 'Fast Charging',
    fastChargingTimeUpto80Perc: 'Fast Charging Time Upto 80%',
    ridingModes: 'Riding Modes',
    additionalFeatures: 'Additional Features',
    callOrsmsalerts: 'Call/SMS Alerts',
    musicControl: 'Music Control',
    centralLocking: 'Central Locking',
    cruiseControl: 'Cruise Control',
    externalSpeakers: 'External Speakers',
    speedometer: 'Speedometer',
    tripmeter: 'Tripmeter',
    Odometer: 'Odometer',
    carryHook: 'Carry Hook',
    abstractrtificialExhaustSoundSystem:
      'Abstractrtificial Exhaust Sound System',
    internetConnectivity: 'Internet Connectivity',
    operatingSystem: 'Operating System',
    processor: 'Processor',
    mobileApplication: 'Mobile Application',
    chargingStationLocater: 'Charging Station Locater',
    gradeability: 'Gradeability',
    clock: 'Clock',
    lowBatteryIndicator: 'Low Battery Indicator',
    bodyType: 'Body Type',
    dimensionsAndCapacity: 'Dimensions And Capacity',
    bootSpace: 'Boot Space',
    width: 'Width',
    length: 'Length',
    height: 'Height',
    saddleHeight: 'Saddle Height',
    groundClearance: 'Ground Clearance',
    wheelbase: 'Wheelbase',
    kerbWeight: 'Kerb Weight',
    loadCarryingCapacity: 'Load Carrying Capacity',
    turnSignalLamp: 'Turn Signal Lamp',
    drls: 'DRLS',
    topSpeed: 'Top Speed',
    motorType: 'Motor Type',
    motorWarrantyForMonths: 'Motor Warranty For Months',
    motorWarrantyForKm: 'Motor Warranty For Km',
    driveType: 'Drive Type',
    batteryWarrantyForMonths: 'Battery Warranty For Months',
    batteryWarrantyForKm: 'Battery Warranty For Km',
    waterProofRating: 'Water Proof Rating',
    suspensionFront: 'Suspension Front',
    suspensionRear: 'Suspension Rear',
    brakesFront: 'Brakes Front',
    brakesRear: 'Brakes Rear',
    tyreSize: 'Tyre Size',
    wheelSize: 'Wheel Size',
    wheelsType: 'Wheels Type',
    ourRating: 'Our Rating',
    path: 'Path',
  };

  valueTransformMap: { [key: string]: (value: any) => string } = {
    exShowroomPrice: (value) => `₹ ${value.toLocaleString('en-IN')}`,
    maxSpeed: (value) => `${value} km/h`,
    chargingTime: (value) => `${(value / 60).toFixed(2)} hours`,
    batteryCapacity: (value) => `${value} kWh`,
    chargingTime0To80Perc: (value) =>
      `${(value / 60).toFixed(2)} hours (0-80%)`,
    chargingTime0To100Perc: (value) =>
      `${(value / 60).toFixed(2)} hours (0-100%)`,
    bookingPrice: (value) => `${value} ₹`,
    accelration0To60kmph: (value) => `${value} sec (0-60 km/h)`,
    accelration0To40kmph: (value) => `${value} sec (0-40 km/h)`,
    continuousPower: (value) => `${value} kW`,
    motorPower: (value) => `${value} kW`,
    rangeOfVehicle: (value) => `${value} km`,
    underseatStorage: (value) => `${value} liters`,
    chargerOutputMin: (value) => `${value} kW`,
    chargerOutputMax: (value) => `${value} kW`,
    gradeability: (value) => `${value} degrees`,
    width: (value) => `${value} mm`,
    length: (value) => `${value} mm`,
    height: (value) => `${value} mm`,
    saddleHeight: (value) => `${value} mm`,
    groundClearance: (value) => `${value} mm`,
    wheelbase: (value) => `${value} mm`,
    kerbWeight: (value) => `${value} kg`,
    loadCarryingCapacity: (value) => `${value} kg`,
    topSpeed: (value) => `${value} km/h`,
    motorWarrantyForMonths: (value) => `${value} months`,
    motorWarrantyForKm: (value) => `${value} km`,
    batteryWarrantyForMonths: (value) => `${value} months`,
    batteryWarrantyForKm: (value) => `${value} km`,
    // ourRating: (value) => `${value}`,
    abstractrtificialExhaustSoundSystem: (value) => `${value}`,
    drls: (value) => `${value}`,
    turnSignalLamp: (value) => `${value}`,
    internetConnectivity: (value) => `${value}`,
    bluetoothConnectivity: (value) => `${value}`,
    geoFencing: (value) => `${value}`,
    antiTheftAlarm: (value) => `${value}`,
    usbchargingPort: (value) => `${value}`,
    fastCharging: (value) => `${value}`,
    fastChargingTimeUpto80Perc: (value) => `${value}`,
    ridingModes: (value) => `${value}`,
    musicControl: (value) => `${value}`,
    externalSpeakers: (value) => `${value}`,
    centralLocking: (value) => `${value}`,
    cruiseControl: (value) => `${value}`,
    lowBatteryIndicator: (value) => `${value}`,
    waterProofRating: (value) => `${value}`,
    suspensionFront: (value) => `${value}`,
    suspensionRear: (value) => `${value}`,
    brakesFront: (value) => `${value}`,
    brakesRear: (value) => `${value}`,
    tyreSize: (value: string) => {
      const sizes = value.split(',').map((size: string) => size.trim());
      return sizes.join('\n');
    },
    wheelSize: (value: string) => {
      const sizes = value.split(',').map((size: string) => size.trim());
      return sizes.join('\n');
    },
    // wheelSize: (value) => `${value}`,
    wheelsType: (value) => `${value}`,
    bodyType: (value) => `${value}`,
    dimensionsAndCapacity: (value) => `${value}`,
    bootSpace: (value) => `${value} liters`,
  };
}

const EMPTY_Application: ProductListModel = {
  twId: 0,
  manufacturer: undefined,
  model: undefined,
  variant: undefined,
  variantType: undefined,
  exShowroomPrice: 0,
  maxSpeed: 0,
  chargingTime: 0,
  conditionOfVehicle: undefined,
  accelration0To60kmph: 0,
  accelration0To40kmph: 0,
  category: undefined,
  available: undefined,
  offlineOronline: undefined,
  bookingSite: undefined,
  bookingPrice: 0,
  continuousPower: 0,
  motorPower: 0,
  rangeOfVehicle: 0,
  batteryType: undefined,
  batteryCapacity: 0,
  chargingTime0To80Perc: 0,
  chargingTime0To100Perc: 0,
  chargingAtHome: undefined,
  noOfBatteries: 0,
  swappableBattery: undefined,
  instrumentConsole: undefined,
  bluetoothConnectivity: undefined,
  navigation: undefined,
  geoFencing: undefined,
  antiTheftAlarm: undefined,
  usbchargingPort: undefined,
  underseatStorage: 0,
  distanceToEmptyIndicator: undefined,
  chargerOutputMin: 0,
  chargerOutputMax: 0,
  chargingPoint: undefined,
  fastCharging: undefined,
  fastChargingTimeUpto80Perc: undefined,
  ridingModes: undefined,
  additionalFeatures: undefined,
  callOrsmsalerts: undefined,
  musicControl: undefined,
  centralLocking: undefined,
  cruiseControl: undefined,
  externalSpeakers: undefined,
  speedometer: undefined,
  tripmeter: undefined,
  Odometer: undefined,
  carryHook: undefined,
  abstractrtificialExhaustSoundSystem: undefined,
  internetConnectivity: undefined,
  operatingSystem: undefined,
  processor: undefined,
  mobileApplication: undefined,
  chargingStationLocater: undefined,
  gradeability: 0,
  clock: undefined,
  lowBatteryIndicator: undefined,
  bodyType: undefined,
  dimensionsAndCapacity: undefined,
  bootSpace: undefined,
  width: 0,
  length: 0,
  height: 0,
  saddleHeight: 0,
  groundClearance: 0,
  wheelbase: 0,
  kerbWeight: 0,
  loadCarryingCapacity: 0,
  turnSignalLamp: undefined,
  drls: undefined,
  topSpeed: 0,
  motorType: undefined,
  motorWarrantyForMonths: 0,
  motorWarrantyForKm: 0,
  driveType: undefined,
  batteryWarrantyForMonths: 0,
  batteryWarrantyForKm: 0,
  waterProofRating: undefined,
  suspensionFront: undefined,
  suspensionRear: undefined,
  brakesFront: undefined,
  brakesRear: undefined,
  tyreSize: undefined,
  wheelSize: undefined,
  wheelsType: undefined,
  ourRating: 0,
  path: undefined,
};
