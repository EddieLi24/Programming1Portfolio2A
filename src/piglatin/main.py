# credit Wrt Tech on Youtube
def piglatin():
  words = input("input sentence: ").split()
  for word in words:
    print(word[1:] + word[:1] + 'ay', end = ' ')

piglatin()