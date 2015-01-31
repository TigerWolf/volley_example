class MainActivity < Android::App::Activity
  def onCreate(savedInstanceState)
    super
    fetch_list
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
end
