namespace NancyOwinConsoleApplication;

uses

  Nancy,
  Newtonsoft.Json,
  System.IO,
  Newtonsoft.Json.Serialization,
  System;

type

  JsonNetSerializer = public class(ISerializer)
  private
    serializer:JsonSerializer;
  protected
  public
    constructor;
    begin
      var settings := new JsonSerializerSettings;
      settings.ContractResolver := new CamelCasePropertyNamesContractResolver;
      serializer := JsonSerializer.Create(settings);
    end;

    method CanSerialize(contentType:String):Boolean;
    begin
      exit (String.Compare(contentType, 'application/json')=0);
    end;

    method Serialize<TModel>(contentType:String; model:TModel;outputStream:System.IO.Stream);
    begin
      using writer := new JsonTextWriter(new StreamWriter(outputStream)) do
      begin
        serializer.Serialize(writer,model);
        writer.Flush;
      end;
    end;

    property Extensions:sequence of String read write;
  end;

end.