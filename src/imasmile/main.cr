require "./../app/app"
require "./../runtime/handler"
require "./../runtime/error_post"

def dat2ohanasi(event)
  begin
    app : App = App.new
    response = app.run

    return response
  rescue ex : LambdaException
    LambdaError.send_slack ex, ex.status_code
  rescue ex
    LambdaError.send_slack ex
  end
end

lambda_handler(dat2ohanasi)