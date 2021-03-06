#pragma once
#ifndef TILE_HPP
#define TILE_HPP

#include <optional>
#include <string>
#include "inc/palette.hpp"
#include "inc/animal.hpp"

namespace ld40 {
	class Tile {
		public:
			Tile(sf::Color colour = Palette::Green, std::string habitat = u8"plains", std::optional<Animal> species = {});
			void set_colour(sf::Color colour = Palette::Green);
			void set_animal(std::optional<Animal> animal = {});
			sf::Color get_colour() const;
			std::optional<Animal> get_animal() const;
			void set_habitat(std::string habitat = u8"plains");
			std::string get_habitat() const;
		private:
			sf::Color colour;
			std::optional<Animal> animal;
			std::string habitat;
	};
}

#endif