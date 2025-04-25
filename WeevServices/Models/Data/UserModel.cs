using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Reflection;
using System.Threading.Tasks;
using Microsoft.Data.SqlClient;
using MySqlConnector;

namespace WeevServices.Models
{
    public class UserModel
    {
        public AppDb Db { get; }

        public UserModel(AppDb db)
        {
            Db = db;
        }

        public async Task<int> AddCustomerenquiries(Customerenquiries customers)
        {
            using var connectionString = Db.Connection;
            MySqlCommand cmd = new MySqlCommand("InsertCustomerenquiries", connectionString);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new MySqlParameter
            {
                ParameterName = "@Usernames",
                DbType = DbType.String,
                Value = customers.Username,
            });
            cmd.Parameters.Add(new MySqlParameter
            {
                ParameterName = "@Emails",
                DbType = DbType.String,
                Value = customers.Email,

            });
            cmd.Parameters.Add(new MySqlParameter
            {
                ParameterName = "@Mobiles",
                DbType = DbType.String,
                Value = customers.Mobile,
            });
            cmd.Parameters.Add(new MySqlParameter
            {
                ParameterName = "@Url",
                DbType = DbType.String,
                Value = customers.Url,
            });

            int result = await Task.Run(() => cmd.ExecuteNonQuery());
            return result;
        }

        public async Task<int> AddProductAsync(Customerenquiries product)
        {
            using var connectionString = Db.Connection;
            await connectionString.OpenAsync(); // Open connection asynchronously

            using MySqlCommand cmd = new MySqlCommand("InsertCustomerenquiries", connectionString);
            cmd.CommandType = CommandType.StoredProcedure;

            // Use MySqlParameter instead of SqlParameter
            cmd.Parameters.Add(new MySqlParameter("UserNames", MySqlDbType.VarChar, 45)).Value = product.Username;
            cmd.Parameters.Add(new MySqlParameter("Emails", MySqlDbType.VarChar, 50)).Value = product.Email;
            cmd.Parameters.Add(new MySqlParameter("Mobiles", MySqlDbType.VarChar, 10)).Value = product.Mobile;
            cmd.Parameters.Add(new MySqlParameter("Url", MySqlDbType.VarChar)).Value = product.Url;


            // Execute the stored procedure
            int result = await cmd.ExecuteNonQueryAsync();

            return result;
        }

    }
}
