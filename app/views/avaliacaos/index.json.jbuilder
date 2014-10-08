json.array!(@avaliacaos) do |avaliacao|
  json.extract! avaliacao, :id, :user
  json.url avaliacao_url(avaliacao, format: :json)
end
