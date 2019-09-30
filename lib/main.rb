module enumerable
    
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

    def my_map
        result = []
        if block_given?
            for i in 0...self.length-1
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

    def my_inject?(arg=nil)
    end

    def my_all
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
        end
    end
end