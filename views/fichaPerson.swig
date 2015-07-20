<!DOCTYPE html>
<html>
<head>
    
   <title>Cargografías Ficha</title>

    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="/favicon.ico" type="image/x-icon" rel="icon" />
    <link href="/favicon.ico" type="image/x-icon" rel="shortcut icon" />

    <link rel="stylesheet" href="//fonts.googleapis.com/css?family=RobotoDraft:400,500,700,400italic">

    <!-- V2 Styles -->    
    <link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="/css/publico.css" />
    <link rel="stylesheet" type="text/css" href="/css/animaciones.css" />

    <!-- V3 Styles -->
    <link rel="stylesheet" href="bower_components/angular-material/angular-material.css">
    <link href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.2.0/css/font-awesome.css" rel="stylesheet">
    <link rel="stylesheet" href="/css/new-timeline.css" type="text/css">

    <!-- V2 Libs -->
    <script src="/js/lib/jquery-2.0.0.min.js"></script>
    <script type="text/javascript" src="js/lib/d3.min.js"></script>


    <!-- V3 Libs -->
    <!-- Angular Material Dependencies -->
    <script src="/bower_components/angular/angular.js"></script>
    <script src="/bower_components/angular-aria/angular-aria.js"></script>
    <script src="/bower_components/angular-animate/angular-animate.js"></script>
    <script src="/bower_components/hammerjs/hammer.js"></script>
    <script src="/bower_components/angular-route/angular-route.min.js"></script>
    <script src="/bower_components/angular-material/angular-material.js"></script>
    <script src="/js/lib/sha1.js"></script>

    <!-- V4 Libs -->
    <script type="text/javascript" src="js/lib/own.js"></script>

    <!-- V2 Libs Angular-->
    <script src="/bower_components/angular-cookies/angular-cookies.js"></script>
    <script src="/bower_components/moment/moment.js"></script>
    <script src="/bower_components/angular-moment/angular-moment.js"></script>
    <script src="/bower_components/moment/lang/es.js"></script>
    

    <script type="text/javascript">
        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-18158765-5']);
        _gaq.push(['_trackPageview']);

        (function() {
            var ga = document.createElement('script');
            ga.type = 'text/javascript';
            ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0];
            s.parentNode.insertBefore(ga, s);
        })();
    </script>

 

</head>

<body class="angled stripes">

    <div class="navbar navbar-fixed-top">
        <div class="navbar-inner">
            <div class="container">
                <a class="brand"><h3>Cargografias - Ficha</h3></a>
                <div class="nav-collapse collapse">
                    <ul class="nav">
                       

                    </ul>
                    <ul class="nav pull-right">
                    </ul>
                </div>
                <!--/.nav-collapse -->
            </div>
        </div>
    </div>


    <div class="main" >
        <h1>{{person.name}}</h1>
        <div><img src="{{person.image}}" /></div>



                    <table class="table table-condensed">
                        <tbody>
                            <tr>
                                <th>Start</th>
                                <th>End</th>
                                <th>Role</th>
                                <th>Label</th>
                                <th>Organization</th>
                            </tr>

        {% for m in person.memberships %}

                            <tr ng-repeat="m in row.memberships">
                                <td>{{m.start_date}}</td>
                                <td>{{m.end_date}}</td>
                                <td>{{m.role}}</td>
                                <td>{{m.label}}</td>
                                <td>
                                    <a target="_blank" href="/{{instanceName}}/organization/{{m.organization_id}}">{{m.organization_id}}</a></td>
                            </tr>
        {% endfor %}

                        </tbody>
                    </table>


    </div>

    <footer class="well">
    </footer>

    
</body>
</html>