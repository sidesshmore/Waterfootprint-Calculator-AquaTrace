-- CreateTable
CREATE TABLE "activity" (
    "id" SERIAL NOT NULL,
    "activity" TEXT,
    "waterfootprint" DECIMAL,

    CONSTRAINT "activity_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "food" (
    "id" SERIAL NOT NULL,
    "fooditems" TEXT,
    "waterfootprint" DECIMAL,

    CONSTRAINT "food_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "userdata" (
    "id" SERIAL NOT NULL,
    "uid" TEXT NOT NULL,
    "item" TEXT NOT NULL,
    "waterfootprint" DECIMAL(65,30) NOT NULL,
    "measure" TEXT NOT NULL,
    "date" DATE NOT NULL,

    CONSTRAINT "userdata_pkey" PRIMARY KEY ("id")
);

