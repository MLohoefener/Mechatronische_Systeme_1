function coordgrd()
  % Draw x y coordinate system and grid in current figure
  % Testet with MATLAB and GNU Octave
  % Manfred Lohöfener, Leipzig, 2017
  % 
  % Usage: coordgrd

  grid on
  grid minor
  line ([0, 0],get (gca, 'ylim'), 'LineWidth', 1)
  line (get (gca, 'xlim'), [0,0], 'LineWidth', 1)
end
