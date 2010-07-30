def rand_string(length=6)
  string = ""
  chars = ("A".."Z").to_a
  length.times do
    string << chars[rand(chars.length-1)]
  end
  string
end

def rand_email(length=6)
  rand_string(length) + '@localhost.com'
end

def rand_bool()
  rand(0) > 0.5
end

def rand_int(digits=3, allow_zero=false)
  a = rand(0)*(10**digits) + (allow_zero ? 0 : 1)
  a.truncate
end
