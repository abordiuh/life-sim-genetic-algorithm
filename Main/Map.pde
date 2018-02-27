import java.util.Arrays; //<>// //<>//

public class EnvMap {
  int XSize = 0;
  int YSize = 0;
  int XScale = 10;
  int YScale = 10;

  public Entity[][] entMap;

  public EnvMap(int XSize, int YSize) {

    entMap = new Entity[XSize][YSize];

    for (Entity[] row : entMap)
      Arrays.fill(row, new EmptyPlace());

    this.XSize = XSize;
    this.YSize = YSize;
  }

  public void executeEntitiesActions() {
    for (int x = 0; x < XSize; x++) {
      for (int y = 0; y < YSize; y++) {
        if ( entMap[x][y]!=null && entMap[x][y].Type != EType.TEmpty) {
          SurroundArea resArea = entMap[x][y].executeNextAction(GenerateArea(x, y, this));
          UpdateArea(x, y, this, resArea);
        }
      }
    }
  }  

  public void placeEntitiesRandomly(int amount) {
    int i = 0;
    while (i < amount) {
      int x = (int)random(0, XSize);
      int y = (int)random(0, YSize);
      if (entMap[x][y].Type != EType.TBot) {
        entMap[x][y] = new Bot(32);
        entMap[x][y].generateRandomActions();
      }        
      i++;
    }
  }

  public void placeResourcesRandomly(int amount) {
    int i = 0;
    while (i < amount) {
      int x = (int)random(0, XSize);
      int y = (int)random(0, YSize);
      if (entMap[x][y].Type == EType.TEmpty) {
        entMap[x][y] = new Resource();
      }
      i++;
    }
  }

  public SurroundArea GenerateArea(int centerX, int centerY, EnvMap map) {
    SurroundArea area = new SurroundArea();
    int counter = 0;
    for (int y = -1; y <= 1; y++) {
      for (int x = -1; x <= 1; x++) {
        if ((centerX + x >= 0 && centerY + y >= 0) && (centerX + x < map.XSize && centerY + y < map.YSize))
          area.SurrAreaType[counter] = map.entMap[centerX + x][centerY + y]; 
        else 
        area.SurrAreaType[counter] = null;

        counter++;
      }
    }
    return area;
  }

  public void UpdateArea(int centerX, int centerY, EnvMap map, SurroundArea area) {
    int counter = 0;
    for (int y = -1; y <= 1; y++) {
      for (int x = -1; x <= 1; x++) {
        if ((centerX + x >= 0 && centerY + y >= 0) && (centerX + x < map.XSize && centerY + y < map.YSize))
          map.entMap[centerX + x][centerY + y] = area.SurrAreaType[counter];

        counter++;
      }
    }
  }

  public void DrawEnvMap() {
    stroke(0);
    for (int i = 0; i < XSize; i++) {
      for (int j = 0; j < YSize; j++) {
        int x = i*XScale;
        int y = j*YScale;

        fill(255);
        stroke(200);

        if (entMap[i][j] != null) {
          switch(entMap[i][j].Type) {
          case TBot : 
            fill(128, 0, 128); 
            break;
          case TDead : 
            fill(128, 128, 128); 
            break;
          case TResource : 
            fill(10, 200, 10); 
            break;
          default : 
            break;
          }
        }
        rect(x, y, XScale, YScale);
      }
    }
  }
}