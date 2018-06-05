namespace NancyOwinConsoleApplication;

uses
  Nancy;

type

  HelloWorldModule = public class(NancyModule)
  private
  protected
  public
    constructor;
    begin

      Get['/'] := _ -> begin
          Console.WriteLine('in method');
          exit Response.AsJson(new class(application:='HelloWorld'))
        end;


    end;
  end;

end.