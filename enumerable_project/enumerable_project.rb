class Array
    def my_each(&prc) #need to work on
        self.length.times do |i|
            prc.call(self[i])
        end
        self
    end

    def my_select(&prc)
        new_arr = []
        
        self.my_each do |item|
            new_arr << item if prc.call(item)
        end

        new_arr
    end

    def my_reject(&prc)
        new_arr = []

        self.my_each do |item|
            new_arr << item if !prc.call(item)
        end

        new_arr
    end

    def my_any?(&prc)
        self.my_each do |item|
            return true if prc.call(item)
        end
        false
    end
    
    def my_all?(&prc)
        self.my_each do |item|
            return false if !prc.call(item)
        end
        true
    end

    def my_flatten #need to work on 
        flattened = []

        self.my_each do |el|
            if el.is_a?(Array)
                flattened.concat(el.my_flatten)
            else
                flattened << el
            end
        end

        flattened
    end

    def my_zip(*arrays) #need to work on
        zipped = []

        self.length.times do |i|
            subzip = [self[i]]

            arrays.my_each do |array|
                subzip << array[i]
            end

            zipped << subzip
        end

        zipped
    end

    def my_rotate(n = 1)
        if n > 0 
            n.times do 
                removed = self.shift
                self.push(removed)
            end
        elsif n < 0 
            (n * -1).times do 
                removed = self.pop  
                self.unshift(removed)
            end
        end
        self

        # Class Solution
        # split_idx = n % self.length

        # self.drop(split_idx) + self.take(split_idx)
    end

    def my_join(separator = "")
        join = ""

        self.my_each do |el|
            join += el
            join += separator
        end
        
        join
    end

    def my_reverse
        new_arr = []

        i = self.length - 1 
        while i >= 0 
            new_arr << self[i]
            i -= 1
        end
        
        new_arr
    end



       
end