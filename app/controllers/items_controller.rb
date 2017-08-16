require 'nokogiri'
require 'open-uri'
require 'json'

class ItemsController < ApplicationController

  def new
  end

  def destroy
    # render json: params
    itemtodestroy = Item.find(params[:id])
    current_event = Event.find(params[:addparam])
    itemtodestroy.events.delete(current_event)
    # itemtodestroy.destroy()
    redirect_to event_path(current_event)
  end

  def create
    # render json: params
    temparr = params[:add_item].each do |e|
      temp = eval(e)
      itemfound = Item.find_by(name: temp["pdt_name"])
      if itemfound == nil
        then
        tempprice = temp["price"].gsub(/\$/,'').to_f
        temp = Item.create(
        name: temp["pdt_name"],
        price: tempprice,
        imageUrl: temp["img_url"],
        product_details_url: temp["pdt_url"]
        )
        tempitem = Item.find(temp.id)
        tempitem.events << Event.find(params[:event_id])
      else
        itemfound.events << Event.find(params[:event_id])
      end
    end
    redirect_to "/events/#{params[:event_id]}"
  end

  def results
    # render json: params['search_text']
    # input: search term
    # output: an array of hashes. one hash per product. each has contains these keys: pdt_name, price, image_url, pdt_url
    # reference: https://github.com/sparklemotion/nokogiri

    # # set up the input variable
    search_term = params['search_text']
    # # To account for search terms with spaces e.g. "peanut butter", need to replace spaces with "+"
    if search_term.split.size > 1
      search_term = search_term.gsub!(/\s/, "+")
    end

    # # set up the output variables
    @arr_of_pdt_hashes = []
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
    doc.css('div.pr_nlst_wrp').each do |pdt_node|
      # if there exists a span.pl_lst_rt node, populate the price; else, populate as $0
      price_node = pdt_node.css('span.pl_lst_rt')
      if price_node.size > 0
        price_incl_symbols = price_node.children[0].content
        # need to get rid of ""\r\n...t\t" from "\r\n\t\t\t\t\t$5.00\r\n\t\t\t\t"
        price_incl_symbols.gsub!(/\r\n\t\t\t\t\t/, "")
        price_incl_symbols.gsub!(/\r\n\t\t\t\t/, "")
        arr_of_prices.push(price_incl_symbols)
      else
        arr_of_prices.push("$0.00")
      end
    end

    # img_url
    doc.css('div.pr_nlst_wrp a p img').each do |node|
      # need to get rid of the extra chars in "\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\nhttp://s3-ap-southeast-1.amazonaws.com/www.fairprice.com.sg/fpol/media/images/product/M/13102195_M1.jpg\r\n\r\n"
      img_url_incl_symbols = node.attr('src')
      img_url_incl_symbols.gsub!(/\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n/, "")
      img_url_incl_symbols.gsub!(/\r\n\r\n/, "")
      arr_of_img_urls.push(img_url_incl_symbols)
    end

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
      @arr_of_pdt_hashes.push(pdt_hash)
    end
  end
end
