[![Build Status](https://travis-ci.org/Akalaimakalai/Funbox_nmax.svg?branch=master)](https://travis-ci.org/Akalaimakalai/Funbox_nmax)

# NMax script

The project contains solution to nmax test task for FunBox

## Script requirements

Напишите скрипт <b>nmax</b>, который делает следующее:
* читает из входящего потока текстовые данные;
* по завершении ввода выводит n самых больших целых чисел, встретившихся в
полученных текстовых данных.
Дополнительные указания:
* числом считается любая непрерывная последовательность цифр в тексте;
* известно, что чисел длиннее 1000 цифр во входных данных нет;
* число n должно быть единственным параметром скрипта;
* код должен быть покрыт тестами;
* код должен быть оформлен в виде гема (содержащего исполняемый файл, код
модулей и т.д.);
* плюсом является размещение на Github и интеграция с Travis CI.
Пример запуска: <br>
```cat sample_data_40GB.txt | nmax 10000```

### Building
The script can be build as a gem with ```gem build nmax.gemspec``` command.

### Installing

The script can be installed as a gem with ```gem install ./nmax-1.0.0.gem``` command.

### Running

Script command: ```cat your_text_file.txt | bin/nmax 42```

## Running the tests

Tests can be run with ```rspec spec/``` command.

## License

This project is licensed under the MIT License - see the LICENSE file for details
