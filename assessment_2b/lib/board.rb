class Board

    

    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @stacks.each { |stack| p stack }
    end

    def self.build_stacks(num)
    two_D = Array.new(num){Array.new}
    end

    def initialize(stacks, max_height)
        if stacks < 4 || max_height < 4
            raise "rows and cols must be >= 4"
        end
    @max_height = max_height
    @stacks = Board.build_stacks(stacks)
    end

    def max_height
        @max_height
    end

        #Else statement is wrong 
    def add(token, stack_i)
        if @stacks[stack_i].length < @max_height
            @stacks[stack_i] << token
            @max_height +=1
            true
        else @stacks[stack_i].length >= @max_height
           return false
        end
    end

    def vertical_winner?(token)
    #check if any of the subarray length is equal to max_heigth
        @stacks.each do |subarray|
            if subarray.length == @max_height
               #If yes, check if all the elements are the given token
                return subarray.all? {|tok| tok.include?(token)}
            #If yes return true
                #if the given token is not fully done return false
         
            end

         end
         false
    end
    
    def horizontal_winner?(token)
      columns = @stacks.transpose
      columns.each do |row|
       return row.all? {|tok| tok.include?(token)}
      end
      false 
    end

    def winner?(token)
        vertical_winner?(token) || horizontal_winner?(token)
    end



end
