import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { VehiclesService } from 'src/app/modules/_services/vehicles.service';
import { Meta, Title } from '@angular/platform-browser';

@Component({
  selector: 'app-CompareMainPage',
  templateUrl: './CompareMainPage.component.html',
  styleUrls: ['./CompareMainPage.component.scss'],
})
export class CompareMainComponent implements OnInit {
  vehicleData: any = {};
  productKeys: string[] = [];
  twowheelerlist: Array<any> = [];
  sections: any[] = [];

  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private vehiclesService: VehiclesService,
    private meta: Meta,
    private titleService: Title
  ) {}

  vehicleDataObjects: any[] = [];

  ngOnInit(): void {
    window.scroll(0, 0);

    this.route.params.subscribe((params) => {
      const ids =
        window.innerWidth > 768
          ? ['twId1', 'twId2', 'twId3', 'twId4']
          : ['twId1', 'twId2'];

      this.vehiclesService.getTwoWheelerData().subscribe((response) => {
        this.twowheelerlist = response;
        ids.forEach((idKey) => {
          // Decode the URL parameter to replace %20 with spaces
          let productName = params[idKey]
            ? decodeURIComponent(params[idKey])
            : params[idKey];

          this.vehicleData[idKey] = { model: {}, list: [] };
          if (productName && productName !== 'NA') {
            this.getTwoWheelerDatas(productName, idKey, this.twowheelerlist);
          } else {
            // If the productName is 'NA', set the vehicleData to an empty object
            this.vehicleData[idKey] = { model: 'NA', list: [] };
          }
        });

        // Continue with further processing
        this.productKeys = Object.keys(this.vehicleData);
        this.populatecards();
        this.updateSEOTags();
        this.updateSections();
      });
    });
  }

  formatVehicleList(list: string[]): string {
    if (list.length <= 1) return list.join('');
    if (list.length === 2) return list.join(' and ');
    return list.slice(0, -1).join(', ') + ', and ' + list[list.length - 1];
  }

  updateSEOTags(): void {
    const names = this.vehicleDataObjects
      .filter((v) => v.model && v.model !== 'NA')
      .map((v) =>
        [v.manufacturer, v.model, v.variant]
          .filter((item) => item && item !== 'NA')
          .join(' ')
      );

    if (names.length === 0) return;

    const formattedList = this.formatVehicleList(names);

    const title = `Compare ${formattedList} | Specs, Battery, Range, Features & Price`;
    const description = `See detailed electric vehicle comparison between ${formattedList}. Compare battery, range, charging time, top speed, features, and prices of top electric bikes and scooters.`;

    this.titleService.setTitle(title);
    this.meta.updateTag({ name: 'description', content: description });
  }

  populatecards() {
    if (this.productKeys.length > 0) {
      this.productKeys.forEach((key) => {
        if (this.vehicleData[key] && this.vehicleData[key].model !== 'NA') {
          // Find all variants for the current manufacturer and model
          const manufacturerModel =
            this.vehicleData[key].manufacturer +
            ' ' +
            this.vehicleData[key].model;
          const variants = this.twowheelerlist
            .filter(
              (item) =>
                item.manufacturer + ' ' + item.model === manufacturerModel
            )
            .map((item) => item.variant);

          this.vehicleDataObjects.push({
            path: this.vehicleData[key].path || 'path/to/default/image.jpg',
            title: manufacturerModel,
            manufacturer: this.vehicleData[key].manufacturer,
            model: this.vehicleData[key].model,
            variant: this.vehicleData[key].variant,
            variants: variants,
            price:
              this.vehicleData[key].exShowroomPrice || 'Price not available',
          });
        } else {
          this.vehicleDataObjects.push({ model: 'NA' });
        }
      });
    }
  }

  getTwoWheelerDatas(
    productName: string,
    key: string,
    twowheelerlist: any[]
  ): void {
    const twowheeler = twowheelerlist.find(
      (i) => i.manufacturer + '_' + i.model + '_' + i.variant === productName
    );
    if (twowheeler) {
      this.vehicleData[key] = twowheeler;
    } else {
      this.vehicleData[key] = { model: {}, list: [] };
    }
  }

  getComparisonTitle(): string {
    const vehicleNames = this.vehicleDataObjects
      .filter((item) => item.model !== 'NA')
      .map((item) => item.title || `${item.manufacturer} ${item.model}`);

    return vehicleNames.length > 0
      ? vehicleNames.join(' vs ')
      : 'Compare Vehicles';
  }

  // Helper function to format section titles
  formatSectionTitle(sectionKey: string): string {
    return sectionKey
      .replace(/([A-Z])/g, ' $1')
      .replace(/^./, (str) => str.toUpperCase());
  }

  objectKeys(obj: any): string[] {
    return Object.keys(obj);
  }

  toggleSection(section: any): void {
    section.open = !section.open;
  }

  onVehicleSelected(vehicle: any, index: number) {
    this.vehicleDataObjects[index] = {
      title: `${vehicle.manufacturer} ${vehicle.model} ${vehicle.variant}`,
      manufacturer: vehicle.manufacturer,
      model: vehicle.model,
      variant: vehicle.variant,
      price: vehicle.price || 'Price not available',
      path: vehicle.path || vehicle.path, // Handle both cases during transition
      variants: vehicle.variants || [],
    };

    const key = `twId${index + 1}`;
    this.getTwoWheelerDatas(
      `${vehicle.manufacturer}_${vehicle.model}_${vehicle.variant}`,
      key,
      this.twowheelerlist
    );
    this.updateSEOTags();
    this.updateSections();
  }

  onCardRemoved(cardData: any, index: number) {
    // Get the key for the card being removed (e.g., 'twId1', 'twId2', etc.)
    const key = this.productKeys[index];

    // Update the vehicleData object for the removed card
    this.vehicleData[key] = { model: 'NA', list: [] };

    // Update the vehicleDataObjects array for the removed card
    this.vehicleDataObjects[index] = { model: 'NA' };

    // Regenerate the sections array to reflect the changes
    this.updateSections();
    this.updateSEOTags();
  }

  isNA = (value: any) =>
    value === 'NA' || value === 0 || value === null || value === undefined;

  updateSections(): void {
    const keyToTitleMap: Record<string, string[]> = {
      powerPerformance: [
        'batteryCapacity',
        'motorType',
        'maxSpeed',
        'chargingTime',
        'continuousPower',
        'motorPower',
        'rangeOfVehicle',
        'chargingTime0To80Perc',
        'chargingTime0To100Perc',
      ],
      brakesWheelsSuspension: [
        'brakesFront',
        'brakesRear',
        'suspensionFront',
        'suspensionRear',
        'tyreSize',
        'wheelSize',
        'wheelsType',
      ],
      dimensionsAndCapacity: [
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
      ],
      featuresTechnology: [
        'instrumentConsole',
        'bluetoothConnectivity',
        'navigation',
        'geoFencing',
        'antiTheftAlarm',
        'usbchargingPort',
        'underseatStorage',
        'distanceToEmptyIndicator',
        'musicControl',
        'internetConnectivity',
        'mobileApplication',
      ],
      warrantyAndReliability: [
        'motorWarrantyForMonths',
        'motorWarrantyForKm',
        'batteryWarrantyForMonths',
        'batteryWarrantyForKm',
        'waterProofRating',
      ],
      performance: [
        'acceleration0To60kmph',
        'acceleration0To40kmph',
        'gradeability',
        'topSpeed',
      ],
      aestheticsAndDesign: ['bodyType', 'turnSignalLamp', 'drls'],
      charging: [
        'chargingAtHome',
        'noOfBatteries',
        'swappableBattery',
        'chargingStationLocater',
        'chargerOutputMin',
        'chargerOutputMax',
        'fastCharging',
        'fastChargingTimeUpto80Perc',
      ],
      additionalFeatures: [
        'abstractrtificialExhaustSoundSystem',
        'callOrsmsalerts',
        'externalSpeakers',
        'carryHook',
        'clock',
        'centralLocking',
        'cruiseControl',
      ],
    };

    const humanReadableMap: Record<string, string> = {
      batteryCapacity: 'Battery Capacity',
      motorType: 'Motor Type',
      maxSpeed: 'Max Speed',
      chargingTime: 'Charging Time',
      continuousPower: 'Continuous Power',
      motorPower: 'Motor Power',
      rangeOfVehicle: 'Range of Vehicle',
      chargingTime0To80Perc: 'Charging Time 0-80%',
      chargingTime0To100Perc: 'Charging Time 0-100%',
      brakesFront: 'Front Brakes',
      brakesRear: 'Rear Brakes',
      suspensionFront: 'Front Suspension',
      suspensionRear: 'Rear Suspension',
      tyreSize: 'Tyre Size',
      wheelSize: 'Wheel Size',
      wheelsType: 'Wheel Type',
      dimensionsAndCapacity: 'Dimensions & Capacity',
      bootSpace: 'Boot Space',
      width: 'Width',
      length: 'Length',
      height: 'Height',
      saddleHeight: 'Saddle Height',
      groundClearance: 'Ground Clearance',
      wheelbase: 'Wheelbase',
      kerbWeight: 'Kerb Weight',
      loadCarryingCapacity: 'Load Carrying Capacity',
      instrumentConsole: 'Instrument Console',
      bluetoothConnectivity: 'Bluetooth Connectivity',
      navigation: 'Navigation',
      geoFencing: 'Geo-Fencing',
      antiTheftAlarm: 'Anti-Theft Alarm',
      usbchargingPort: 'USB Charging Port',
      underseatStorage: 'Underseat Storage',
      distanceToEmptyIndicator: 'Distance to Empty Indicator',
      musicControl: 'Music Control',
      internetConnectivity: 'Internet Connectivity',
      mobileApplication: 'Mobile Application',
      motorWarrantyForMonths: 'Motor Warranty (Months)',
      motorWarrantyForKm: 'Motor Warranty (Kilometers)',
      batteryWarrantyForMonths: 'Battery Warranty (Months)',
      batteryWarrantyForKm: 'Battery Warranty (Kilometers)',
      waterProofRating: 'Waterproof Rating',
      accelration0To60kmph: 'Acceleration 0-60 kmph',
      accelration0To40kmph: 'Acceleration 0-40 kmph',
      gradeability: 'Gradeability',
      topSpeed: 'Top Speed',
      bodyType: 'Body Type',
      turnSignalLamp: 'Turn Signal Lamp',
      drls: 'Daytime Running Lights (DRLs)',
      chargingAtHome: 'Charging at Home',
      noOfBatteries: 'Number of Batteries',
      swappableBattery: 'Swappable Battery',
      chargingStationLocater: 'Charging Station Locator',
      chargerOutputMin: 'Charger Output (Min)',
      chargerOutputMax: 'Charger Output (Max)',
      fastCharging: 'Fast Charging',
      fastChargingTimeUpto80Perc: 'Fast Charging Time (80%)',
      abstractrtificialExhaustSoundSystem: 'Artificial Exhaust Sound System',
      callOrsmsalerts: 'Call or SMS Alerts',
      externalSpeakers: 'External Speakers',
      carryHook: 'Carry Hook',
      clock: 'Clock',
      centralLocking: 'Central Locking',
      cruiseControl: 'Cruise Control',
    };

    const valueTransformMap: { [key: string]: (value: any) => string } = {
      exShowroomPrice: (value) =>
        this.isNA(value) ? 'NA' : `₹ ${value.toLocaleString('en-IN')}`,

      maxSpeed: (value) => (this.isNA(value) ? 'NA' : `${value} km/h`),
      chargingTime: (value) =>
        this.isNA(value) ? 'NA' : `${(value / 60).toFixed(2)} hours`,
      batteryCapacity: (value) => (this.isNA(value) ? 'NA' : `${value} kWh`),
      chargingTime0To80Perc: (value) =>
        this.isNA(value) ? 'NA' : `${(value / 60).toFixed(2)} hours (0–80%)`,
      chargingTime0To100Perc: (value) =>
        this.isNA(value) ? 'NA' : `${(value / 60).toFixed(2)} hours (0–100%)`,
      bookingPrice: (value) => (this.isNA(value) ? 'NA' : `₹ ${value}`),

      acceleration0To60kmph: (value) =>
        this.isNA(value) ? 'NA' : `${value} sec (0–60 km/h)`,
      acceleration0To40kmph: (value) =>
        this.isNA(value) ? 'NA' : `${value} sec (0–40 km/h)`,
      continuousPower: (value) => (this.isNA(value) ? 'NA' : `${value} kW`),
      motorPower: (value) => (this.isNA(value) ? 'NA' : `${value} kW`),
      rangeOfVehicle: (value) => (this.isNA(value) ? 'NA' : `${value} km`),
      underseatStorage: (value) =>
        this.isNA(value) ? 'NA' : `${value} liters`,
      chargerOutputMin: (value) => (this.isNA(value) ? 'NA' : `${value} kW`),
      chargerOutputMax: (value) => (this.isNA(value) ? 'NA' : `${value} kW`),
      gradeability: (value) => (this.isNA(value) ? 'NA' : `${value} degrees`),

      width: (value) => (this.isNA(value) ? 'NA' : `${value} mm`),
      length: (value) => (this.isNA(value) ? 'NA' : `${value} mm`),
      height: (value) => (this.isNA(value) ? 'NA' : `${value} mm`),
      saddleHeight: (value) => (this.isNA(value) ? 'NA' : `${value} mm`),
      groundClearance: (value) => (this.isNA(value) ? 'NA' : `${value} mm`),
      wheelbase: (value) => (this.isNA(value) ? 'NA' : `${value} mm`),
      kerbWeight: (value) => (this.isNA(value) ? 'NA' : `${value} kg`),
      loadCarryingCapacity: (value) =>
        this.isNA(value) ? 'NA' : `${value} kg`,
      topSpeed: (value) => (this.isNA(value) ? 'NA' : `${value} km/h`),

      motorWarrantyForMonths: (value) =>
        this.isNA(value) ? 'NA' : `${value} months`,
      motorWarrantyForKm: (value) => (this.isNA(value) ? 'NA' : `${value} km`),
      batteryWarrantyForMonths: (value) =>
        this.isNA(value) ? 'NA' : `${value} months`,
      batteryWarrantyForKm: (value) =>
        this.isNA(value) ? 'NA' : `${value} km`,

      abstractrtificialExhaustSoundSystem: (value) =>
        this.isNA(value) ? 'NA' : `${value}`,
      drls: (value) => (this.isNA(value) ? 'NA' : `${value}`),
      turnSignalLamp: (value) => (this.isNA(value) ? 'NA' : `${value}`),
      internetConnectivity: (value) => (this.isNA(value) ? 'NA' : `${value}`),
      bluetoothConnectivity: (value) => (this.isNA(value) ? 'NA' : `${value}`),
      geoFencing: (value) => (this.isNA(value) ? 'NA' : `${value}`),
      antiTheftAlarm: (value) => (this.isNA(value) ? 'NA' : `${value}`),
      usbchargingPort: (value) => (this.isNA(value) ? 'NA' : `${value}`),
      fastCharging: (value) => (this.isNA(value) ? 'NA' : `${value}`),
      fastChargingTimeUpto80Perc: (value) =>
        this.isNA(value) ? 'NA' : `${value}`,
      ridingModes: (value) => (this.isNA(value) ? 'NA' : `${value}`),
      musicControl: (value) => (this.isNA(value) ? 'NA' : `${value}`),
      externalSpeakers: (value) => (this.isNA(value) ? 'NA' : `${value}`),
      centralLocking: (value) => (this.isNA(value) ? 'NA' : `${value}`),
      cruiseControl: (value) => (this.isNA(value) ? 'NA' : `${value}`),
      lowBatteryIndicator: (value) => (this.isNA(value) ? 'NA' : `${value}`),
      waterProofRating: (value) => (this.isNA(value) ? 'NA' : `${value}`),
      suspensionFront: (value) => (this.isNA(value) ? 'NA' : `${value}`),
      suspensionRear: (value) => (this.isNA(value) ? 'NA' : `${value}`),
      brakesFront: (value) => (this.isNA(value) ? 'NA' : `${value}`),
      brakesRear: (value) => (this.isNA(value) ? 'NA' : `${value}`),

      tyreSize: (value: string | null | undefined) => {
        if (!value || this.isNA(value)) return 'NA';
        const sizes = value.split(',').map((size: string) => size.trim());
        return sizes.join('\n');
      },
      wheelSize: (value: string) => {
        if (!value || this.isNA(value)) return 'NA';
        const sizes = value.split(',').map((size: string) => size.trim());
        return sizes.join('\n');
      },
      wheelsType: (value) => (this.isNA(value) ? 'NA' : `${value}`),
      bodyType: (value) => (this.isNA(value) ? 'NA' : `${value}`),
      dimensionsAndCapacity: (value) => (this.isNA(value) ? 'NA' : `${value}`),
      bootSpace: (value) => (this.isNA(value) ? 'NA' : `${value} liters`),
      instrumentConsole: (value) => (this.isNA(value) ? 'NA' : `${value}`),
      navigation: (value) => (this.isNA(value) ? 'NA' : `${value}`),
      distanceToEmptyIndicator: (value) =>
        this.isNA(value) ? 'NA' : `${value}`,
      mobileApplication: (value) => (this.isNA(value) ? 'NA' : `${value}`),
      motorType: (value) => (this.isNA(value) ? 'NA' : `${value}`),
      chargingAtHome: (value) => (this.isNA(value) ? 'NA' : `${value}`),
      noOfBatteries: (value) => (this.isNA(value) ? 'NA' : `${value}`),
      swappableBattery: (value) => (this.isNA(value) ? 'NA' : `${value}`),
      chargingStationLocater: (value) => (this.isNA(value) ? 'NA' : `${value}`),
      callOrsmsalerts: (value) => (this.isNA(value) ? 'NA' : `${value}`),
      carryHook: (value) => (this.isNA(value) ? 'NA' : `${value}`),
      clock: (value) => (this.isNA(value) ? 'NA' : `${value}`),
    };

    this.sections = Object.keys(keyToTitleMap).map(
      (sectionKey: string, index: number) => ({
        open: index === 0,
        title: this.formatSectionTitle(sectionKey),
        features: keyToTitleMap[sectionKey]
          .map((key: string) => {
            const transform =
              valueTransformMap[key] || ((value: any) => `${value}`);
            const values = this.productKeys.map((id: string) => {
              if (this.vehicleData[id]?.model === 'NA') return 'NA';
              return transform(this.vehicleData[id]?.[key]) || 'NA';
            });

            // Show only if at least one vehicle has a non-NA value
            const atLeastOneAvailable = values.some(
              (v) => v !== 'NA' && v !== ''
            );
            if (!atLeastOneAvailable) return null;

            return {
              key: humanReadableMap[key],
              values,
            };
          })
          .filter((f) => f !== null),
      })
    );
  }
}
