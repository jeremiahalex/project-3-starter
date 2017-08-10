# input: search term
# output: an array of hashes. one hash per product. each has contains these keys: pdt_name, price, image_url, pdt_url
# reference: https://github.com/sparklemotion/nokogiri

require 'nokogiri'
require 'open-uri'

# # set up the input variable
search_term = 'peanut butter'
# # To account for search terms with spaces e.g. "peanut butter", need to replace spaces with "+"
if search_term.split.size > 1
  search_term = search_term.gsub!(/\s/, "+")
end

# # set up the output variables
arr_of_pdt_hashes = []
arr_of_pdt_names = []
arr_of_prices = []
arr_of_img_urls = []
arr_of_pdt_urls = []

# # Fetch and parse HTML document
doc = Nokogiri::HTML(open('http://www.fairprice.com.sg/webapp/wcs/stores/servlet/SearchDisplay?searchTerm=' + search_term + '&categoryId=&storeId=10001&catalogId=10051&langId=-1&pageSize=24&beginIndex=0&sType=SimpleSearch&resultCatEntryType=2&showResultsPage=true&searchSource=Q&pageView='))

# pdt_name
doc.css('div.pr_nlst_wrp a h3').each do |node|
  arr_of_pdt_names.push(node.content)
end

# price
# doc.css('span.pl_lst_rt').each do |node|
#   # need to get rid of ""\r\n...t\t" from "\r\n\t\t\t\t\t$5.00\r\n\t\t\t\t"
#   price_incl_symbols = node.content
#   price_incl_symbols.gsub!(/\r\n\t\t\t\t\t/, "")
#   price_incl_symbols.gsub!(/\r\n\t\t\t\t/, "")
#   arr_of_prices.push(price_incl_symbols)
# end

# trying to sub $0 where product has no price (i.e. is free)
doc.css('div.pr_nlst_wrp').each do |pdt_node|
  # p 'pdt_node is: -------------------------------------'
  # p pdt_node
  # if there exists a span.pl_lst_rt node after the p.pro_cont node, populate the price; else, populate as $0
  # i'm getting the price node... but how do i get to the price???
  price_node = pdt_node.css('span.pl_lst_rt')
  # p 'price_node is: -------------------------------------'
  # p price_node
  # p 'price_node.children is: -------------------------------------'
  # p price_node.children
  # DOESNT WORK: p 'price_node.children.content is: -------------------------------------'
  # DOESNT WORK: p price_node.children.content
  # p 'price_node.children[0] is: -------------------------------------'
  # p price_node.children[0]
  # p 'price_node.children[0].text is: -------------------------------------'
  # p price_node.children[0].text
  # p 'price_node.children[0].content is: -------------------------------------'
  # p price_node.children[0].content
  if price_node.size > 0
    # p 'price_node.content is: -------------------------------------'
    # DOESNT WORK: p price_node.content
    price_incl_symbols = price_node.children[0].content
    price_incl_symbols.gsub!(/\r\n\t\t\t\t\t/, "")
    price_incl_symbols.gsub!(/\r\n\t\t\t\t/, "")
    arr_of_prices.push(price_incl_symbols)
  else
    arr_of_prices.push("$0.00")
    # p arr_of_prices
  end
  # inspecting the node, for development purposes
  # for i in 0..node.children.size
  #   p 'Child No. ' + (i+1).to_s + ' is:'
  #   p node.children[i].to_s
  # end
  # if child No. 10 has the regex, extract the price and populate array. Else, check if child No. 12 has the price and if so populate the array. Else, insert $0.00 into the array
  # regexp_have_price = "pl_lst_rt"
  # regexp_price = "$###?.00"
  # break
end
# p arr_of_prices

# img_url
doc.css('div.pr_nlst_wrp a p img').each do |node|
  # need to get rid of the extra chars in "\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\nhttp://s3-ap-southeast-1.amazonaws.com/www.fairprice.com.sg/fpol/media/images/product/M/13102195_M1.jpg\r\n\r\n"
  img_url_incl_symbols = node.attr('src')
  img_url_incl_symbols.gsub!(/\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n/, "")
  img_url_incl_symbols.gsub!(/\r\n\r\n/, "")
  arr_of_img_urls.push(img_url_incl_symbols)
end
# # side note: doc.at returns only one result:
# # puts doc.at('div.pr_nlst_wrp a p img').attr('src')

# pdt_url
substring = "fairprice"
doc.css('div.pr_nlst_wrp a').each do |node|
  pdt_url = node.attr('href')
  if pdt_url
    if pdt_url.include? substring
      arr_of_pdt_urls.push(pdt_url)
    end
  end
end
# remove duplicates from the array
arr_of_pdt_urls.uniq!

# # populate the output array
no_of_results = arr_of_pdt_names.size
for i in 0..no_of_results-1
  pdt_hash = {}
  pdt_hash["pdt_name"] = arr_of_pdt_names[i]
  pdt_hash["price"] = arr_of_prices[i]
  pdt_hash["img_url"] = arr_of_img_urls[i]
  pdt_hash["pdt_url"] = arr_of_pdt_urls[i]
  arr_of_pdt_hashes.push(pdt_hash)
end
p arr_of_pdt_hashes

# # checking outputs
# # all these arrays should be the same size
# p arr_of_pdt_hashes.size
# p arr_of_pdt_names.size
# p arr_of_prices.size
# p arr_of_img_urls.size
# p arr_of_pdt_urls.size
#
# # these contain the search results
# p arr_of_pdt_hashes
# p arr_of_pdt_names
# p arr_of_prices
# p arr_of_img_urls
# p arr_of_pdt_urls
