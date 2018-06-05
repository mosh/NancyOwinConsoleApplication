namespace NancyOwinConsoleApplication;

uses
  Owin;

type

  Startup = public class
  private
  protected
  public

    method Configuration(app:IAppBuilder);
    begin
      app.UseNancy;

    end;
  end;

end.