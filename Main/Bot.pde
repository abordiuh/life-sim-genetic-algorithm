public enum EType {
  TBot, TDead, TResource, TEmpty
};

public class Entity {
  public EType Type = EType.TEmpty;
  int actionPointer = 0;
  Action[] actArray = new Action[ActionsArraySize];
  SurroundArea srrArea = new SurroundArea();


  public void generateRandomActions() {
    if (Type != EType.TEmpty) { 
      for (int i = 0; i < ActionsArraySize; i++) {
        actArray[i] = new Action((int)random(0, 3.1), (int)random(0, DIRECTIONS.DSIZE.ordinal()));
      }
    }
  }  

  public SurroundArea executeNextAction(SurroundArea area) {
    if (Type != EType.TEmpty) { 
      if (actionPointer < ActionsArraySize-1)
        actionPointer++;
      else
        actionPointer = 0;
    }
    return area;
  }
}

public class Bot extends Entity {
  float EnergyLevel = 0;

  public Bot(float EnergyLevel) {
    this.Type = EType.TBot;
    this.EnergyLevel = EnergyLevel;
  }

  public SurroundArea executeNextAction(SurroundArea area) {
    if (EnergyLevel > 0) {
      EnergyLevel = EnergyLevel + actArray[actionPointer].Execute(area);
      
    } else this.Type = EType.TDead;
    
    return super.executeNextAction(area);
  }

  int X = 0;
  int Y = 0;
}

public class EmptyPlace extends Entity
{
  public EmptyPlace() {
    Type = EType.TEmpty;
  }
}

public class Resource extends Entity
{
  public Resource() {
    Type = EType.TResource;
  }
}