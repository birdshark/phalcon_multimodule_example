<?php

namespace Application\Common\Models;

class Articles extends ModelBase
{

    static $WhiteList = ['id','content','description','article_label','article_type'];
    /**
     *
     * @var integer
     * @Primary
     * @Identity
     * @Column(column="id", type="integer", length=10, nullable=false)
     */
    public $id;

    /**
     *
     * @var string
     * @Column(column="title", type="string", length=128, nullable=false)
     */
    public $title;

    /**
     *
     * @var string
     * @Column(column="content", type="string", nullable=false)
     */
    public $content;

    /**
     *
     * @var string
     * @Column(column="article_label", type="string", length=255, nullable=false)
     */
    public $article_label;

    /**
     *
     * @var integer
     * @Column(column="article_type", type="integer", length=4, nullable=false)
     */
    public $article_type;

    /**
     *
     * @var string
     * @Column(column="description", type="string", nullable=false)
     */
    public $description;

    /**
     *
     * @var integer
     * @Column(column="created_at", type="integer", length=11, nullable=false)
     */
    public $created_at;

    /**
     *
     * @var integer
     * @Column(column="updated_at", type="integer", length=11, nullable=false)
     */
    public $updated_at;

    /**
     *
     * @var integer
     * @Column(column="article_status", type="integer", length=4, nullable=false)
     */
    public $article_status;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->setSchema("test");
        $this->setSource("articles");
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'articles';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Articles[]|Articles|\Phalcon\Mvc\Model\ResultSetInterface
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Articles|\Phalcon\Mvc\Model\ResultInterface
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

    /**
     * @param $where
     * @return mixed
     */
    public static function articleCount($where){
        return parent::count($where);
    }

    /**
     * @param $where
     * @param $offset
     * @param $limit
     * @param $fields
     * @return \Phalcon\Mvc\Model\ResultsetInterface
     */
    public static function articleList($where,$offset,$limit,$fields){
        $parameters = $where;
        array_push($parameters, array('limit'=>$limit));
        if($offset != null){
            $parameters['offset'] = $offset;
        }
        if($limit != null){
            $parameters['limit'] = $limit;
        }
        return parent::find($parameters);
    }



}
