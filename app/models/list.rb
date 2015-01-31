class List
  attr_reader :result

  def initialize(json)
    # read your JSON response here for example:
    list_array = []
    for i in 0..(json.length-1)
        object = json.get(i)
        list_array << object.getString("title")
        # Your code here
    end
    @result = list_array
  end
end
