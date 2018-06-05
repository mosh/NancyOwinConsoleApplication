namespace NancyOwinConsoleApplication;

uses
  Nancy,
  Nancy.Bootstrapper,
  Nancy.TinyIoc;

type

  BootStrapper = public class(DefaultNancyBootstrapper)
  private
    method get_InternalConfiguration: NancyInternalConfiguration;
    begin
      exit Nancy.Bootstrapper.NancyInternalConfiguration.WithOverrides(c ->
      method
      begin
        c.Serializers.Insert(0, typeOf(JsonNetSerializer));
      end
      );
    end;
  protected

    method ApplicationStartup(container:TinyIoCContainer; pipelines:IPipelines);override;
    begin
      // your customization goes here
    end;

  public


    property InternalConfiguration: NancyInternalConfiguration read get_InternalConfiguration; override;
  end;

end.