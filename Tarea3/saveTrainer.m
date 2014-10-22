function saveTrainer(trainer,j)
   j=num2str(j);
   name=['trainer_' j '.mat'];
   save(name, 'trainer');
end