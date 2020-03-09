<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <!-- Bootstrap -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>

        <title>AddGame</title>
    </head>
    
    <style>
        body {background-image: url("magic_circuit.jpg");
        color: white;}
    </style>

    <body>
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/anime", "root", "");
            Statement s = conexion.createStatement();
            request.setCharacterEncoding("UTF-8");

            // Comprueba la existencia del número de alumno introducido
            String consultaNumAnime = "SELECT * FROM anime WHERE animeID="
                    + Integer.valueOf(request.getParameter("animeID"));

            ResultSet numeroDeAnime = s.executeQuery(consultaNumAnime);
            numeroDeAnime.last();

            if (numeroDeAnime.getRow() != 0) {
                out.println("Lo siento, no se ha podido dar de alta, ya existe anime con este código:  "
                        + request.getParameter("juegoID") + ".");
            } else {
                String insercion = "INSERT INTO anime (animeID, nomAnime, numAnime, sagaAnime, genreAnime) VALUES ("
                        + Integer.parseInt(request.getParameter("animeID"))
                        + ", '" + request.getParameter("nomAnime")
                        + "', " + Integer.parseInt(request.getParameter("numAnime"))
                        + ", '" + request.getParameter("sagaAnime")
                        + "', '" + request.getParameter("genreAnime")
                        + "')";

                s.execute(insercion);
                out.println("Anime añadido correctamente.");
            }
            conexion.close();
        %>
        <br>
        <a href="pagPrincipal.jsp" class="btn btn-primary"><span class="glyphicon glyphicon-home"></span> Página principal</button>
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
</body>
</html>