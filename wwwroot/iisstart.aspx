<%@ Page Language="C#" %>

<!DOCTYPE html>

<html>
<head>
    <title><%=System.Configuration.ConfigurationManager.AppSettings["title"]%></title>
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
          background-color:<%=System.Configuration.ConfigurationManager.AppSettings["head_color"]%>;
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
            <div class="column-50" style="text-align:center; height:125px">
                <h3><center>Application Server</center></h3>
                <h2 style="color:#3377ff;" > Application Server: <%= Server.MachineName %><br/> IP Address: <%@ Import Namespace="System.Net" %>
        <% 
            string ipValue = "error";
            try {
                string hostName = Dns.GetHostName();
                IPAddress[] addresses = Dns.GetHostAddresses(hostName);
                foreach (IPAddress address in addresses) {
                    if (address.AddressFamily == System.Net.Sockets.AddressFamily.InterNetwork) {
                        ipValue = address.ToString();
                        break;
                    }
                }
            } catch (System.Net.Sockets.SocketException) {
                // Handle exception
            }
            %><%= ipValue %><br/>nano: <%= System.Environment.GetEnvironmentVariable("nano") %></h2>
            </div>
            <div class="column">
            </div>
        </div>
            <div class="column">
            </div>
        </div>

        <div class="row">
            <div>
                <center><img src="images/logo_v1.png" alt="CLOUDBOURNE" class="responsive" width="90px" style="margin:10px"></center>
            </div>
        </div>
    </form>
</body>
</html>
