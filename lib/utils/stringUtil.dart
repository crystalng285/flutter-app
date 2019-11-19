String avoidOverFlowText(String input, [int maxLength = 32, String specicalChars = "..."]){
  if(input == null || input.isEmpty){
    return "";
  }

  if(maxLength == null || maxLength == 0){
    return input;
  }

  if(specicalChars == null || specicalChars.isEmpty)
  {
    return input;
  }

  if(input.length < maxLength)
    {
      return input;
    }
  else if(input.length == maxLength)
    {
      return input;
    }

  return input.substring(0,maxLength) + specicalChars;
}

