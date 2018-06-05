namespace NancyOwinConsoleApplication;

uses
  Microsoft.Owin.Hosting;

type
  Program = class
  public

    class method Main(args: array of String): Int32;
    begin

      var port := 5001;

      using WebApp.Start<Startup>(String.Format('http://localhost:{0}', port)) do
      begin
        Console.WriteLine(String.Format('On Port {0}', port));
        Console.ReadLine();
      end;

    end;

  end;


end.