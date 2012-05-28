SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    primary.dom_id = :menu

    primary.item :camiseteria, 'Camiseteria', '/camiseteria'
    primary.item :chico_rei, 'Chico Rei', '/chico-rei'
  end
end
