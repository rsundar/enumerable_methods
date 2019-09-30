module Enumerable 
    def my_each
        if block_given?
            for i in self
                yield(i)
            end
        else
            raise "Error: No block given!"
        end
    end

    def my_each_with_index
        if block_given?
            for i in 0...self.length-1
                yield(self[i],i)
            end
        else
            raise "Error: No block given!"
        end
    end

    def my_map
        result = []
        if block_given?
            for i in 0...self.length
                result.push(yield(self[i]))
            end
        else
            raise "Error: Please provide a block!"
        end
        result
    end

    def my_select
        result = []
        if block_given?
            self.my_each {|i| result.push(i) if(yield(i))}
        else
            raise "Error: Please provide a block!"
        end
        result
    end

    def my_inject
        result = self[0]
        self[1..-1].my_each {|i| result = yield(result,i)}
        result
    end

    def my_any?(arg=nil)
        if block_given?
            self.my_each{|i| return true if(yield(i))}
        elsif arg.class == Class
            self.my_each{|i| return true if i.class == arg}
        elsif arg.class == Regexp
            self.my_each{|i| return true unless (i =~ Regexp).nil?}
        elsif arg.nil?
            self.my_each{|i| return true if i}
        else
            raise "Error: Please provide a block!"
        end
        false
    end

    def my_all?(arg=nil)
        if block_given?
            self.my_each{|i| return false if(yield(i))}
        elsif arg.class == Class
            self.my_each{|i| return false unless i.class == arg}
        elsif arg.class == Regexp
            self.my_each{|i| return false unless (i =~ Regexp).nil?}
        elsif arg.nil?
            self.my_each{|i| return false if i}
        else
            raise "Error: Please provide a block!"
       end
        true
    end
    
    def my_count
        count = 0
        if block_given?
            self.my_each {|i| count+=1 if(yield(i))}
        else
            self.my_each {|i| count+=1}
        end
        count
    end

    def my_none?(arg=nil)
        if block_given?
            self.my_each{|i| return false if(yield(i))}
        elsif arg.class == Class
            self.my_each{|i| return false if i.class == arg}
        elsif arg.class == Regexp
            self.my_each{|i| return false unless (i =~ Regexp).nil?}
        elsif arg.nil?
            self.my_each{|i| return false if i}
        else
            raise "Error: Please provide a block!"
        end
        true
    end

    def multiply_els
        return self.my_inject { |i,n| i*n}
    end
end