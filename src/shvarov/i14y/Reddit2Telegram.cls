Class shvarov.i14y.Reddit2Telegram Extends Ens.DataTransformDTL [ DependsOn = (dc.Demo.PostMessage, Telegram.Request) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

/// Description
ClassMethod FormJSONForTelegramData(json As %String) As %String
{
    Set res={
            "chat_id": "-1001983366307",
            "text": (json)
        }
    // do something
    Return res
}

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='dc.Demo.PostMessage' targetClass='Telegram.Request' create='new' language='objectscript' >
<assign value='##class(shvarov.i14y.Reddit2Telegram).FormJSONForTelegramData(source.Post.Selftext)' property='target.Data' action='set' />
<assign value='sendMessage' property='target.Method' action='set' />
</transform>
}

}
