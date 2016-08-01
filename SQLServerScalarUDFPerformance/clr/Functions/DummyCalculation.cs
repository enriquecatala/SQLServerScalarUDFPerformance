using System;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using Microsoft.SqlServer.Server;

public partial class UserDefinedFunctions
{
    [Microsoft.SqlServer.Server.SqlFunction]
    public static SqlDouble DummyCalculationClr(SqlInt32 num1, SqlInt32 num2)
    {

        double steps = (double)num1 % 123456;

        double no_of_sides_in_the_polygon = (double)num2 % 54321;

        double return2 = 1.0;

        double retorno;

        retorno = Math.Sin(Math.PI / 180 * (180.0 - 360 / (no_of_sides_in_the_polygon + steps)) / 2) / Math.Sin(Math.PI * 2 / (no_of_sides_in_the_polygon + steps));

        if (retorno < 1.0)
            retorno = 1.0;
        if (retorno > 1.0 && retorno < 5000)
            return2 = 5.0;
        if (retorno >= 5000 && retorno < 100000)
            return2 = 6.0;
        if (retorno >= 100000 && retorno < 200000)
            return2 = 7.0;
        if (retorno >= 200000)
            return2 = 9.0;

        retorno = retorno * (1.0 - return2);
        
        return (retorno);
    }
}