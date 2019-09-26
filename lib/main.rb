module enumerable
    
    def my_each
        for i in self
            yield(i)
        end
    end

    def my_each_with_index
        for i in 0...self.length-1
            yield(self[i],i)
        end
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

    def my_inject
    end

    def my_all
    end
end