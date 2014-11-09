% just a gaussian function
function[val] = gauss(mu, sigma, arguments) 
  val = (1/sqrt(2*pi*sigma^2)*exp(-(arguments-mu).^2/(2*sigma^2)));
end
