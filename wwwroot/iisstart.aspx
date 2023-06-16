<%@ Page Language="C#" %>
<%@ Import Namespace="System" %>
<%@ Import Namespace="System.Diagnostics" %>
<%@ Import Namespace="System.Net" %>
<%@ Import Namespace="System.IO" %>
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
            height: 50px;
        }

        .column-mid {
            background-color: #3377ff;
            float: left;
            width: 25%;
            padding: 10px;
            height: 50px;
        }

        .column-mid-white {
            background-color: <%=(System.Environment.GetEnvironmentVariable("COLOR") ?? "RoyalBlue") %>;
            color: white;
            float: left;
            width: 25%;
            padding: 10px;
            height: 50px;
        }

        .column-50 {
            background-color: #f1f1f1;
            float: left;
            width: 50%;
            padding: 10px;
            height: 50px;
        }

        .column-50-blue {
            background-color: blue;
            float: left;
            width: 50%;
            padding: 10px;
            height: 50px;
        }

        .text-bk {
            background-color: #3377ff;
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

        /* Added styles for text visibility */
        h1,
        h2,
        h3,
        h4,
        h5,
        h6,
        p,
        span {
            color: #333; /* Set desired text color */
            margin: 10; /* Reset margins to avoid unwanted space */
        }
        
        /* Updated styles for labels */
        .column-mid-white label,
        .column-mid-white span {
            color: white;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="row">
            <div>
                <h1 style="color: #DAA520;"><center>AppZ Demo</center></h1>
                <h2><center>Fully Automated Multi-Cloud Management Platform</center></h2>
            </div>
        </div>

        <div class="row">
            <div class="column">
            </div>

            <div class="column-mid-white">
                <asp:Label runat="server" ID="app"></asp:Label>
            </div>

            <div class="column-mid-white" style="text-align: right">
                <asp:Label runat="server" ID="ver"></asp:Label>
            </div>

            <div class="column">
            </div>
        </div>

        <div class="row">
            <div class="column" style="height: 100px">
            </div>

            <div class="column-50" style="text-align: center; height: 100px">
                <h1 style="width: 100%"><span id="timeLiteral"></span></h1>
            </div>
            <div class="column" style="height: 100px">
            </div>
        </div>

        <div class="row">
            <div class="column">
            </div>

            <div class="column-mid-white">
                <asp:Label runat="server" ID="ip"></asp:Label>
            </div>

            <div class="column-mid-white" style="text-align: right">
                <asp:Label runat="server" ID="nano"></asp:Label>
            </div>

            <div class="column">
            </div>
        </div>

        <div class="row">
            <div class="column">
            </div>
            <div class="column-50" style="text-align: center; height: 125px">
                <h3><center>Application Server</center></h3>
                <h4 style="color: #3377ff;"><center><asp:Literal runat="server" ID="iisVersionLiteral" /></center></h4>
            </div>
            <div class="column">
            </div>
        </div>

        <div class="row">
            <div>
                <center>
                    <img src="https://raw.githubusercontent.com/rejith/tomcat-loadgen/master/WebContent/images/logo_v1.png" alt="CLOUDBOURNE" class="responsive" width="90px" style="margin: 10px">
                </center>
            </div>
        </div>

        <script type="text/javascript">
            function updateTime() {
                var now = new Date();
                var hours = now.getHours();
                var minutes = now.getMinutes();
                var seconds = now.getSeconds();

                var timeString = formatTimeComponent(hours) + ":" +
                    formatTimeComponent(minutes) + ":" +
                    formatTimeComponent(seconds);

                document.getElementById('timeLiteral').textContent = timeString;
            }

            function formatTimeComponent(component) {
                return component < 10 ? "0" + component : component;
            }

            setInterval(updateTime, 1000);
        </script>

        <script runat="server">
            protected void Page_Load(object sender, EventArgs e)
            {
                if (!IsPostBack)
                {
                    title.Text = System.Environment.GetEnvironmentVariable("TITLE") ?? "";
                    app.Text = System.Environment.GetEnvironmentVariable("APP") ?? "";
                    ver.Text = "Version: " + (System.Environment.GetEnvironmentVariable("VER") ?? "");
                    ip.Text = "IP: " + (GetIPv4Address());
                    nano.Text = "NANO: " + (System.Environment.GetEnvironmentVariable("NANO") ?? "");
                    iisVersionLiteral.Text = GetIISVersion();
                }
            }

            private string GetIPv4Address()
            {
                string hostName = Dns.GetHostName();
                IPHostEntry hostEntry = Dns.GetHostEntry(hostName);

                foreach (IPAddress address in hostEntry.AddressList)
                {
                    if (address.AddressFamily == System.Net.Sockets.AddressFamily.InterNetwork)
                    {
                        return address.ToString();
                    }
                }

                return "IPv4 address not found";
            }

            private string GetIISVersion()
			{
				string iisExePath = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.System), "inetsrv", "w3wp.exe");
				var versionInfo = FileVersionInfo.GetVersionInfo(iisExePath);

				string iisVersion = "Microsoft-IIS/" + versionInfo.ProductMajorPart + "." + versionInfo.ProductMinorPart;

				if (Environment.OSVersion.Version.Major == 5 && Environment.OSVersion.Version.Minor == 2)
				{
					iisVersion += " (Windows Server 2003)";
				}
				else if (Environment.OSVersion.Version.Major == 6 && Environment.OSVersion.Version.Minor == 0)
				{
					iisVersion += " (Windows Server 2008)";
				}
				else if (Environment.OSVersion.Version.Major == 6 && Environment.OSVersion.Version.Minor == 1)
				{
					iisVersion += " (Windows Server 2008 R2)";
				}
				else if (Environment.OSVersion.Version.Major == 6 && Environment.OSVersion.Version.Minor == 2)
				{
					iisVersion += " (Windows Server 2012)";
				}
				else if (Environment.OSVersion.Version.Major == 6 && Environment.OSVersion.Version.Minor == 3)
				{
					iisVersion += " (Windows Server 2012 R2)";
				}
				else if (Environment.OSVersion.Version.Major == 10 && Environment.OSVersion.Version.Minor == 0)
				{
					iisVersion += " (Windows Server 2016)";
				}
				else if (Environment.OSVersion.Version.Major == 10 && Environment.OSVersion.Version.Minor == 0 && Environment.OSVersion.Version.Build == 14393)
				{
					iisVersion += " (Windows Server 2016 Version 1607)";
				}
				// Add more conditions for other Windows Server versions if needed

				return iisVersion;
			}


        </script>
    </form>
</body>
</html>
