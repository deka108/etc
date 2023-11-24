CXX = clang++

LDFLAGS_COMMON = -std=c++2a

FILENAME:=  $(patsubst %.cpp,%.o,$(wildcard *.cpp))

all: $(FILENAME)
	@echo $(FILENAME)

%.o : %.cpp
	$(CXX) $< $(LDFLAGS_COMMON) -o $@

run:
	./$(TARGET)

clean:
	rm -rf *.o $(TARGET)