<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v13.1, Version=13.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxSpellChecker.v13.1, Version=13.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxSpellChecker" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>How to paste URL to ASPxHtmlEditor as a hyperlink</title>
    <script type="text/javascript">
        var process = -1;

        function he_OnCommandExecuted(s, e) {
            if (e.commandName === ASPxClientCommandConsts.KBPASTE_COMMAND) {
                process = 0;
                return;
            }
            if (e.commandName === ASPxClientCommandConsts.PASTE_COMMAND) {
                process = 0;
                return;
            }
        }
        function he_OnHtmlChanged(s, e) {
            if (!ASPxClientUtils.ie && process === 0) {
                process = -1;
                var text = s.GetHtml();
                s.SetHtml("");
                var newText = text.replace(/(?:(https?:\/\/[\/\w\.\,\-\?\=\&\%\+\#\&&amp;]*[^&lt;^&lt;a\s^\)]\/?))(?=<br>|<\/div>|$|\)|\s|\))/g, "<a href=\"$1\">$1</a>");
                s.ExecuteCommand(ASPxClientCommandConsts.PASTEHTML_COMMAND, newText);
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <dx:ASPxHtmlEditor ID="he" runat="server">
            <ClientSideEvents HtmlChanged="he_OnHtmlChanged" CommandExecuted="he_OnCommandExecuted" />
        </dx:ASPxHtmlEditor>
    </form>
</body>
</html>
