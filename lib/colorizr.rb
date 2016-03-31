
class String
    @@colors = {:red=>31,:green=>32,:yellow=>33,:blue=>34,:pink=>35,
    :light_blue=>94,:white=>97,:light_gray=>37,:black=>30}

    def self.colors
      arr=[]
      @@colors.each do |key,value|
        arr << key
      end
      arr
    end
    def self.create_colors
      #code to generate all color methods goes here
      @@colors.each do |color,value|
        self.class_eval("
          def #{color}
            puts \"\\e[#{value}m\"+self+\"\\e[0m\"
          end")
      end
    end
    def self.sample_colors
      colors = String.colors
      colors.each do |color|
        puts color.to_s.send(color)
      end
    end
end

String.create_colors
