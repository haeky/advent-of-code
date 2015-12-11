input = 'hxbxwxba'
until !!(input =~ Regexp.union(('a'..'x').map { |x| x + x.succ + x.succ.succ })) && !!(input !~ /([oil])/) && !input.scan(/(.)\1.*(.)\2/).first.nil? && input.scan(/(.)\1.*(.)\2/).first.size > 0
  input.next!
end
p input
