# Ruby Custom Enumerables

## Overview

Project for The Odin Project (https://www.theodinproject.com/) as part of the Advanced Ruby section (focused on blocks, procs, and lambdas). Project recreates a number of Enumerable methods, including:
- #each
- #each_with_index
- #select
- #all?
- #any?
- #none?
- #count
- #map
- #inject/#reduce

Among the files, custom_enumerables.rb contains the custom methods while compare_methods.rb contains comparions between the custom methods and the originals. 

## Potential Next Steps

While compare_methods.rb contains a comparison between custom methods and the originals, this could be improved with testing (have not yet covered section on TDD).

Additionally, some of the methods (e.g., any?, all?, none?) accept optional pattern arguments which are not included within the custom methods. Pattern argument could be added in the future (in which case method would check whether pattern === element) but would require some additional work to adapt the method to accept hashes (in which case method would check whether hash.assoc(key) == pattern, as per Ruby docs).
