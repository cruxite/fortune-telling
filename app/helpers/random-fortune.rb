module RandomFortuneHelper
  def get_random_fortune
    offset = rand(Fortune.count)
    # return a random fortune offset off of the first fortune record
    return Fortune.offset(offset).first
  end
end
