<!doctype html>
<html lang="en">
  <head>
    <title>Title</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  </head>
  <body>
    <div class="offset-4 col-4">
        <form action="QuenmatkhauServlet" method="post">
            <div class="card mt-5">
                <div class="card-header">
                    <b>Quên mật khẩu</b>
                </div>
                <div class="card-body">
                    <jsp:include page="/common/infom.jsp"></jsp:include>
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                        <label for="username">Username</label> <input type="text"
                            class="form-control" name="username" id="username"
                            aria-describedby="usernameHid" placeholder="Username"> <small
                            id="usernameHid" class="form-text text-muted">Username is
                            required</small>
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label> <input type="email"
                            class="form-control" name="email" id="email" placeholder="Email"
                            ><small
                            id="usernameHid" class="form-text text-muted">Email is
                            required</small>
                    </div>
                        </div>
                    </div>
                    
                </div>
                <div class="card-footer text-muted">
                    <button class="btn btn-success">Thực hiện</button>
                </div>
            </div>
        </form>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  </body>
</html>