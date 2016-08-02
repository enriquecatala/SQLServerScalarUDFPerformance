using System;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using Microsoft.SqlServer.Server;

/*
  -- 
 -- Enrique Catala is Mentor at SolidQ: http://www.solidq.com 
 -- Microsoft Data Platform MVP:        https://mvp.microsoft.com/es-es/PublicProfile/5000312?fullName=Enrique%20Catala 
 -- Blog:                               http://www.enriquecatala.com 
 -- Twitter:                            https://twitter.com/enriquecatala 
 -- 
*/
public partial class UserDefinedFunctions
{
    [Microsoft.SqlServer.Server.SqlFunction(IsPrecise = true, IsDeterministic = true, DataAccess = DataAccessKind.Read)]
    public static SqlString DummyCalculationWithDataAccessClr(SqlInt32 num1,SqlInt32 num2)
    {
        double steps = (double)num1 % 123456;
        double no_of_sides_in_the_polygon = (double)num2 % 54321;
        double tmp2 = 1.0;
        double tmp;
        string retorno;

        tmp = Math.Sin(Math.PI / 180 * (180.0 - 360 / (no_of_sides_in_the_polygon + steps)) / 2) / Math.Sin(Math.PI * 2 / (no_of_sides_in_the_polygon + steps));

        if (tmp < 1.0)
            tmp = 1.0;
        if (tmp > 1.0 && tmp < 5000)
            tmp2 = 5.0;
        if (tmp >= 5000 && tmp < 100000)
            tmp2 = 6.0;
        if (tmp >= 100000 && tmp < 200000)
            tmp2 = 7.0;
        if (tmp >= 200000)
            tmp2 = 9.0;

        tmp = tmp * (1.0 - tmp2);

        // Now the DataAccess part
        using (SqlConnection conn = new SqlConnection("context connection=true"))
        {
            SqlCommand command = new SqlCommand();
            command.Connection = conn;
            conn.Open();

            int valor = Math.Abs((int)tmp+1 % 100000);
            string query = @"SELECT String1 + String2
                            FROM dbo.Random_Strings
                            WHERE id = @p1";
            command.Parameters.AddWithValue("@p1", valor);
            command.CommandText = query;
            command.CommandType = CommandType.Text;

            retorno = (string)command.ExecuteScalar();
            if (String.IsNullOrEmpty(retorno))
            {
                retorno = String.Empty;
            }

        }

        return (retorno);
    }

}
