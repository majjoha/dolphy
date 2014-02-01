class Haiku
  def initialize
    @poems = [
      "three more shots panic
      rain on rooftops in my heart
      menacing again",

      "whispers fade and I
      bitterest fog haunted moon
      haunted moon heartfelt",

      "in her eyes children
      roaches scuttle in my room
      mocking bird mutters"
    ]
  end

  def random
    index = rand(3)
    @poems[index].gsub("\n","<br/>")
  end
end
