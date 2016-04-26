Release 0

1. What are some common HTTP status codes?
  * 200 OK
  * 300 Multiple Choices
  * 301 Moved Permanently
  * 302 Found
  * 304 Not Modified
  * 307 Temporary Redirect
  * 400 Bad Request
  * 401 Unauthorized
  * 403 Forbidden
  * 404 Not Found
  * 410 Gone
  * 500 Internal Server Error
  * 501 Not Implemented
  * 503 Service Unavailable
  * 550 Permission Denied

https://www.smartlabsoftware.com/ref/http-status-codes.htm

2. What is the difference between a GET request and a POST request?  When might each be used?
  * GET requests, asks for data from a specific resource (retrieve remote data); include required data in URL.  One might use GET requests for safe actions, unsensitive data, short requests, and requests where it doesn't matter if the request is repeated; is more like a question.
  * POST requests submit data to a specific resource to be processed and might be used (insert/update remote data); provides additional data from the browser to the server in the message body.  One might use POST requests for unsafe actions, sensitive data, and long requests; is more like an order.

http://www.w3schools.com/tags/ref_httpmethods.asp
http://www.diffen.com/difference/GET_(HTTP)_vs_POST_(HTTP)
http://blog.teamtreehouse.com/the-definitive-guide-to-get-vs-post
http://www.w3.org/2001/tag/doc/whenToUseGet.html

3. What is a cookie?  How does it relate to HTTP requests?
  * A cookie is a way for the server to keep track if a request is made from the same web browser.  This is particulary useful because it allows users to stay logged-in in a website.  When a server receives an HTTP request, it sends back a cookie value with its response.  As information is being passed back and forth between the browser and the server, the cookie value will also be passed with the requests as well.  Most web browsers now have local storage API, which takes care of the client-side storage issue that cookies were created to fix.  

https://developer.mozilla.org/en-US/docs/Web/HTTP/Cookies
