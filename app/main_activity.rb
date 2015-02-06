class MainActivity < Android::App::Activity
  def onCreate(savedInstanceState)
    super
    fetch_list
    #post_example
  end

  def fetch_list
    url = "http://jsonplaceholder.typicode.com/posts"
    success_listener = VolleyMotion::RequestListener.new(self, List)
    error_listener = VolleyMotion::ErrorListener.new
    get = VolleyMotion::JsonArrayRequest.build(url, success_listener, error_listener)
    VolleyMotion::RequestQueue.build(self).add(get)
  end

  def update_display(list)
    results = list.result
    # do something with your object here like adding to a ListView
    list = Android::Widget::ListView.new(self)
    list.adapter = Android::Widget::ArrayAdapter.new(self, 17367043, results)
    self.contentView = list
  end

  def post_example
    p "We are now making a post request!"
    url = "http://requestb.in/oy6acsoy"
    success_listener = VolleyMotion::RequestListener.new(self, List)
    error_listener = VolleyMotion::ErrorListener.new

    params = {}
    params[Java::Lang::String.new("test")] = Java::Lang::String.new("My test string")

    post = MyPostRequest.new(VolleyMethods::POST, url, params, success_listener, error_listener)
    request_queue.add(post)
  end
end
