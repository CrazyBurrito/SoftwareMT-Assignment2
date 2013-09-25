class Dessert
  def initialize(name, calories)
   # def name=(name)
      @name=name
   # end

    #def calories=(calories)
      @calories=calories
   # end

    def name
      @name
    end

    def calories
      @calories
    end
  end

  def healthy?
    if(@calories.to_i < 1)
      return true
    else
      return false
    end
  end

  def delicious?
   return true
  end
end

class JellyBean < Dessert
  def initialize(name, calories, flavor)

 #   def flavor=(flavor)
      @flavor = flavor
#    end
  end

  def delicious?
    if(@flavor=="black licorice")
      return false
    else
      return true
    end
  end

end

class Class
  def attr_accessor_with_history(attr_name)
    attr_name=attr_name.to_s
    attr_reader attr_name
    attr_reader attr_name+"_history"
    class_eval %Q{
      def #{attr_name}=(attr_name)
        @attr_name = attr_name
        if @#{attr_name}_history
          @#{attr_name}_history << attr_name
        else
          @#{attr_name}_history = Array.new
          @#{attr_name}_history << nil
          @#{attr_name}_history << attr_name
        end
      end
    }
  end
end

class Foo
  attr_accessor_with_history :bar
end

class Numeric
  @@currencies = {'dollar' => 1, 'yen' => 0.013, 'euro' => 1.292, 'ruppee' => 0.019}
  def method_missing(method_id)
    singular_currency = method_id.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      self * @@currencies[singular_currency]
    else
      super
    end
  end

  def in(key)
    string = key.to_s.gsub(/s$/, '')
    if @@currencies.has_key?(string)
      self / @@currencies[string]
    end
  end
end

class String
  def palindrome?()
    string = self.downcase
    string = string.gsub(/\W/, "")
    reverse = string.reverse
    reverse == string
  end
end

class Array
  def palindrome?()
    reverse =Array.new()
    self.each do |v|
      reverse.unshift(v)
    end
    reverse == self
  end
end

class CartesianProduct < Array
  def initialize(a,b)
    a.each do |ae|
      b.each do |be|
        self.push([ae,be])
      end
    end
  end
end


puts"\n====array===="
puts [1,2,3,4,3,2,1].palindrome?
puts [1,2,3,4].palindrome?

puts "\n=====pal===="
puts "mom".palindrome?
puts "cuba".palindrome?

puts "\n====dessert===="
b= Dessert.new("brownie", 1000)
puts b.healthy?
puts b.delicious?

puts "\n====jellybean===="
l= JellyBean.new("licorice", 5, "black licorice")
puts l.healthy?
puts l.delicious?

puts "\n====attr===="
f= Foo.new
f.bar = 1
f.bar = 2
puts f.bar_history.to_s

puts "\n====currency===="
puts 5.euro.in(:rupees).to_s
