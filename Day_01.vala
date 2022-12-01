string readfile(string path_file)
{
	FileStream	stream = FileStream.open (path_file, "r");
	string		content_file = "";

	char buf[100];
	while (stream.gets (buf) != null) {
		content_file += (string)buf;
	}
	return (content_file);
}

public class Elf{
	public Elf(string bagage, int id){
		_sum_calories = calories_counter(bagage);
		_id = id;
	}

	public void get_calories_position (Elf []elves)
	{
		int	pos = 1;

		foreach (var elf in elves)
			if (elf._id != this._id)
				if (this._sum_calories < elf._sum_calories)
					pos++;
		_position = pos;
	}

	private int calories_counter(string bagage){
		int		nb = 0;
		string	[]element = bagage.split("\n");

		foreach (var ele in element)
			nb += int.parse(ele);
		return (nb);
	}

	public int	_sum_calories;
	public int	_id;
	public int _position;
}

int	get_max_calories(Elf []elfs)
{
	int max = -1;

	foreach (var elf in elfs)
		if (elf._sum_calories > max)
			max = elf._sum_calories;
	return (max);
}

int	get_top_three(Elf []elves)
{
	int	sum = 0;

	foreach (var elf in elves)
		elf.get_calories_position(elves);
	foreach (var elf in elves)
		if (elf._position <= 3)
			sum += elf._sum_calories;
	return (sum);
}

int	main(string []args)
{
	Elf 	[]elfs = null;
	string	content_file = readfile("./day01");
	string	[]elfs_content = content_file.split("\n\n");
	int		i = 0;

	foreach (var elf_content in elfs_content)
	{
		elfs += new Elf(elf_content, i + 1);
		i++;
	}
	//Part 1
	print(@"Elf with max calories has: $(get_max_calories(elfs)) calories");
	// Part 2
	print(@"Sum of top three of elves calories: $(get_top_three(elfs)) calories");
	return (0);
}
