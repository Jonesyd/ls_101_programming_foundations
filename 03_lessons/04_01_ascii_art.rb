# rock = "The Flintstones Rock"
# 10.times { puts rock.prepend(" ") }

# solution

10.times { |number| puts (" " * number) + "The Flintstones Rock" }
