#pragma once
#ifndef MAIN_STATE_HPP
#define MAIN_STATE_HPP

#include "inc/state.hpp"
#include <vector>
#include <cstdint>
#include <optional>
#include <SFML/Graphics/RectangleShape.hpp>
#include <SFML/System/Vector2.hpp>
#include <SFML/Graphics/Sprite.hpp>
#include "inc/tile.hpp"
#include "inc/species_catalogue.hpp"

namespace ld40 {
	class MainState : public State {
		public:
			MainState(sf::RenderWindow &window, TextureManager &tm);
			virtual void integrate(std::uint8_t controls) override;
			virtual void render() override;
		private:
			sf::Vector2<std::uint8_t> size;
			sf::RectangleShape zone;
			sf::Vector2<std::int8_t> position;
			std::uint64_t turn;
			bool over;
			std::optional<sf::Vector2<std::int8_t>> selected;
			std::optional<Species> incoming;
			std::vector<std::vector<Tile>> board;
			sf::Sprite sprite;
			SpeciesCatalogue catalogue;
	};
}

#endif