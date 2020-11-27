[CmdletBinding()]
PARAM(
    [parameter()]
    [ValidateSet('Initialize-Environment')]
    [String]
    $function
)

function Initialize-Environment {
     
    $location = Get-location
    $scriptLocation = $PSCommandPath | Split-Path -Parent

    try
    {
        Set-location $scriptLocation

        if (Test-Path TeacherBoard.db) {
            rm TeacherBoard.db
        }
        
        New-Item TeacherBoard.db

        # if (Test-Path Migrations) {
        #     rm Migrations
        # }

        if (Test-Path .\Data\Migrations) { 
            rm .\Data\Migrations\*
        }

        dotnet tool install --global dotnet-ef

        #dotnet tool install -g Microsoft.Web.LibraryManager.Cli

        #libman restore
        
        dotnet build

        dotnet ef migrations add initial --context ApplicationDbContext -p TeacherBoard.csproj -s TeacherBoard.csproj
        
        dotnet ef database  update --context ApplicationDbContext --verbose
    } 
    catch
    {
        Set-location $scriptLocation
        throw;
    }

     Set-location $location
}

& $function