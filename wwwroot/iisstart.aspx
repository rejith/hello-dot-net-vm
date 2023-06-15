<%@ Page Language="C#" %>
<!DOCTYPE html>
<html>
<head>
    <title><asp:Literal runat="server" ID="title" /></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="utf-8">
    <style>
        * {
            box-sizing: border-box;
            font-family: verdana;
        }

        label {
            padding: 1px 1px 1px 0;
            display: inline-block;
        }

        .column {
            float: left;
            width: 25%;
            padding: 10px;
            height: 50px; /* Should be removed. Only for demonstration */
        }

        .column-mid {
            background-color:#3377ff;
            float: left;
            width: 25%;
            padding: 10px;
            height: 50px; /* Should be removed. Only for demonstration */
        }

        .column-mid-white {
            background-color:RoyalBlue;
            color: white;
            float: left;
            width: 25%;
            padding: 10px;
            height: 50px; /* Should be removed. Only for demonstration */
        }

        .column-50 {
            background-color:#f1f1f1;
            float: left;
            width: 50%;
            padding: 10px;
            height: 50px; /* Should be removed. Only for demonstration */
        }

        .column-50-blue {
            background-color:blue;
            float: left;
            width: 50%;
            padding: 10px;
            height: 50px; /* Should be removed. Only for demonstration */
        }

        .text-bk {
            background-color:#3377ff;
        }

        /* Clear floats after the columns */
        .row:after {
            content: "";
            display: table;
            clear: both;
        }

        .responsive {
            width: 100%;
            max-width: 250px;
            height: auto;
        }

    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div class="row">
            <div>
                <h1 style="color:#DAA520;"><center>AppZ Demo</center></h1>
                <h2><center>Fully Automated Multi-Cloud Management Platform</center></h2>
            </div>
        </div>

        <div class="row">
            <div class="column">
            </div>

            <div class="column-mid-white">
                <asp:Label runat="server" ID="app"></asp:Label>
            </div>

            <div class="column-mid-white" style="text-align:right">
                <asp:Label runat="server" ID="ver"></asp:Label>
            </div>

            <div class="column">
            </div>
        </div>

        <div class="row">
            <div class="column" style="height:100px">
            </div>

            <div class="column-50" style="text-align:center; height:100px">
                <h1><asp:Literal runat="server" ID="time" /></h1>
            </div>

            <div class="column" style="height:100px">
            </div>
        </div>

        <div class="row">
            <div class="column">
            </div>

            <div class="column-mid-white">
                <asp:Label runat="server" ID="ip"></asp:Label>
            </div>

            <div class="column-mid-white" style="text-align:right">
                <asp:Label runat="server" ID="nano"></asp:Label>
            </div>

            <div class="column">
            </div>
        </div>

        <div class="row">
            <div class="column">
            </div>
            <div class="column-50" style="text-align:center; height:125px">
                <h3><center>Application Server</center></h3>
                <h2 style="color:#3377ff;"><center>IIS </center></h2>
            </div>
            <div class="column">
            </div>
        </div>

        <div class="row">
            <div>
                <center><img src="https://raw.githubusercontent.com/rejith/tomcat-loadgen/master/WebContent/images/logo_v1.png" alt="CLOUDBOURNE" class="responsive" width="90px" style="margin:10px"></center>
            </div>
        </div>

        <script runat="server">
            protected void Page_Load(object sender, EventArgs e)
            {
                if (!IsPostBack)
                {
                    title.Text = System.Environment.GetEnvironmentVariable("TITLE") ?? "";
                    app.Text = System.Environment.GetEnvironmentVariable("APP") ?? "";
                    ver.Text = System.Environment.GetEnvironmentVariable("VER") ?? "";
                    ip.Text = System.Environment.GetEnvironmentVariable("IP") ?? "";
                    nano.Text = System.Environment.GetEnvironmentVariable("NANO") ?? "";
                }
            }
        </script>

        <script type="text/javascript">
            function updateTime() {
                var now = new Date();
                var hours = now.getHours();
                var minutes = now.getMinutes();
                var seconds = now.getSeconds();

                var timeString = formatTimeComponent(hours) + ":" +
                    formatTimeComponent(minutes) + ":" +
                    formatTimeComponent(seconds);

                document.getElementById('<%= time.ClientID %>').innerHTML = timeString;
            }

            function formatTimeComponent(component) {
                return component < 10 ? "0" + component : component;
            }

            setInterval(updateTime, 1000);
        </script>
    </form>
</body>
</html>
