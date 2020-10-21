Quando("estou autenticado na API") do
  @response = login.post_fazer_login
  @token = @response.parsed_response["data"]["token"]
end

Quando("faco a requisicao com os dados do produto") do
  @body = {
    "produtonome": "Nintendo Wii",
    "produtovalor": 1599.00,
    "produtocores": [
      "Preto",
      "branco",
    ],
    "componentes": [
      {
        "componentenome": "Controle Nintendo Wii",
        "componentequantidade": 2,
      },
      {
        "componentenome": "Cabo de força Nintendo Wii",
        "componentequantidade": 1,
      },
    ],
  }.to_json
  @response = HTTParty.post @produto, :body => @body, :headers => { "token" => "#{@token}", "Content-Type" => "application/json" }
  puts @response.body
end
